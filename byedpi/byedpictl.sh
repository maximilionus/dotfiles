#!/bin/bash
set -e

cmd_help() {
    cat <<EOF
$0

COMMANDS:
    mode [tun,proxy]:
        Set routing to tunnel all traffic to local proxy, or use it as a plain
        SOCKS5 proxy server, requiring manual connection from user.

        Default active: proxy mode.
    help:
        Show this message and exit.
EOF
}

cmd_mode() {
    case $1 in
        tun)
            sudo hev-socks5-tunnel /etc/byedpi/hev-socks5-tunnel.yaml &
            sudo ip rule add uidrange 1001-1001 lookup 110 pref 28000 || true
            sudo ip route add default via 192.168.1.1 dev enp9s0 metric 50 table 110 || true
            sudo ip route add default via 172.20.0.1 dev byedpi-tun metric 1 || true
            ;;

        proxy)
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
    mode)
        cmd_mode $2
        ;;
    *)
        echo "Invalid argument $1"
        echo "Use \"help\" command."
        exit 1
esac
