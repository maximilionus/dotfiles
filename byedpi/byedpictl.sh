#!/bin/bash
set -e

set_mode() {
    case $1 in
        # Setting iptables rules as root is required to prevent the traffic
        # self redirection.
        redirect)
            sudo iptables -t nat -A OUTPUT -p tcp -m owner ! --uid-owner root \
                --dport 443 -j REDIRECT --to-port 4080
            echo "Successfully changed the mode to redirect."
            echo "All traffic will now be automatically redirected to proxy."
            ;;

        proxy)
            sudo iptables -t nat -D OUTPUT -p tcp -m owner ! --uid-owner root \
                --dport 443 -j REDIRECT --to-port 4080
            echo "Successfully changed the mode to proxy (default)"
            echo "Manual user connection to proxy server is required."
            ;;
        *)
            echo "Error: Invalid mode: \"$1\"."
            echo "Choose from \"redirect\" and \"proxy\"."
    esac
}

case $1 in
    mode)
        set_mode $2
        ;;
    *)
        echo "Error: Invalid argument: \"$1\"."
        exit 1
esac
