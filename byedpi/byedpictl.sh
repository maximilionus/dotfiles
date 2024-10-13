#!/bin/bash
set -e

show_help() {
    cat <<EOF
$0

COMMANDS:
    mode [redirect,proxy]:
        Set routing to redirect all TCP traffic to local proxy, or use it as a
        plain SOCKS5 proxy server, requiring manual connection from user.

        Default: proxy mode.
    help:
        Show this message and exit.
EOF
}

set_mode() {
    case $1 in
        # Setting iptables rules as root is required to prevent the traffic
        # self redirection.
        redirect)
            sudo iptables -t nat -A OUTPUT -p tcp -m owner ! --uid-owner root \
                -j REDIRECT --to-port 4080
            echo "Successfully changed the mode to redirect."
            echo "All TCP traffic will now be automatically redirected to proxy."
            ;;

        proxy)
            sudo iptables -t nat -D OUTPUT -p tcp -m owner ! --uid-owner root \
                -j REDIRECT --to-port 4080
            echo "Successfully changed the mode to proxy (default)"
            echo "Manual user connection to proxy server is required."
            ;;
        *)
            echo "Error: Invalid mode: \"$1\"."
            echo "Choose from \"redirect\" and \"proxy\"."
    esac
}

case $1 in
    help)
        show_help
        ;;
    mode)
        set_mode $2
        ;;
    *)
        echo "Invalid argument $1"
        echo "Use \"help\" command."
        exit 1
esac
