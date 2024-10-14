#!/bin/bash
set -e

cmd_help() {
    cat <<EOF
$0

COMMANDS:
    tun <bool>:
        Set routing to tunnel all traffic to local proxy, or use a plain SOCKS5
        proxy server, requiring manual connection from user.

        Default: false.
    help:
        Show this message and exit.
EOF
}

cmd_tun() {
    case $1 in
        true)
            sudo hev-socks5-tunnel /etc/byedpi/hev-socks5-tunnel.yaml &
            sudo ip rule add uidrange 1001-1001 lookup 110 pref 28000 || true
            sudo ip route add default via 192.168.1.1 dev enp9s0 metric 50 table 110 || true
            sudo ip route add default via 172.20.0.1 dev byedpi-tun metric 1 || true

            echo "Successfully changed the mode to full traffic tunneling."
            ;;

        false)
            sudo kill -9 $(pidof hev-socks5-tunnel)

            sudo ip rule del uidrange 1001-1001 lookup 110 pref 28000
            sudo ip route del default via 192.168.1.1 dev enp9s0 metric 50 table 110
            sudo ip route del default via 172.20.0.1 dev byedpi-tun metric 1

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
        cmd_help
        ;;
    tun)
        cmd_tun $2
        ;;
    *)
        echo "Invalid argument $1"
        echo "Use \"help\" command."
        exit 1
esac
