#!/bin/bash
set -e

CONF_DIR="/etc/byedpi"
LOG_DIR="/var/log/byedpi"
PID_DIR="/var/run/byedpi"

cmd_help() {
    cat <<EOF
$0

COMMANDS:
    tun <start|stop|restart>
        Control the background routing to tunnel all traffic through the
        byedpi proxy.
    help
        Show this message and exit.
EOF
}

cmd_tun() {
    case $1 in
        start)
            start_tunneling
            echo "Successfully enabled full traffic tunneling."
            ;;
        stop)
            stop_tunneling
            echo "Successfully stopped the tunneling."
            ;;
        restart)
            stop_tunneling
            start_tunneling
            echo "Tunnel successfully restarted."
            ;;
        *)
            echo "Error: Invalid mode: \"$1\"."
    esac
}

prepare_dirs() {
    mkdir -p "$LOG_DIR"
    mkdir -p "$PID_DIR"
}

start_tunneling() {
    prepare_dirs

    nohup su - byedpi -s /bin/bash -c \
"ciadpi --ip 127.0.0.1 --port 4080 \
--udp-fake=2 --oob=2 --md5sig \
--auto=torst --timeout=3" \
> $LOG_DIR/server.log 2>&1 & echo $! > $PID_DIR/server.pid

    nohup hev-socks5-tunnel $CONF_DIR/hev-socks5-tunnel.yaml \
        > $LOG_DIR/tunnel.log 2>&1 & echo $! > $PID_DIR/tunnel.pid

   while true; do
        sleep 0.2
        if ip tuntap list | grep -q byedpi-tun; then
            break
        fi

        echo "Waiting for tunnel interface..."
    done

    user_id=$(id -u byedpi)
    nic_name=$(ip route show to default | awk '$5 != "byedpi-tun" {print $5; exit}')
    gateway_addr=$(ip route show to default | awk '$5 != "byedpi-tun" {print $3; exit}')

    ip rule add uidrange $user_id-$user_id lookup 110 pref 28000
    ip route add default via $gateway_addr dev $nic_name metric 50 table 110
    ip route add default via 172.20.0.1 dev byedpi-tun metric 1
}

stop_tunneling() {
    user_id=$(id -u byedpi)
    nic_name=$(ip route show to default | awk '$5 != "byedpi-tun" {print $5; exit}')
    gateway_addr=$(ip route show to default | awk '$5 != "byedpi-tun" {print $3; exit}')

    ip rule del uidrange $user_id-$user_id lookup 110 pref 28000
    ip route del default via "$gateway_addr" dev "$nic_name" metric 50 table 110
    ip route del default via 172.20.0.1 dev byedpi-tun metric 1

    kill $(cat $PID_DIR/tunnel.pid)
    kill $(cat $PID_DIR/server.pid)
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
