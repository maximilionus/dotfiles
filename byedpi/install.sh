#!/bin/bash
set -e

SERVICE="byedpi.service"
CONF_DIR="/etc/byedpi"
BIN_DIR="/usr/local/bin"

echo "-> Preparing"
mkdir -vp "$CONF_DIR"
id -u byedpi &>/dev/null || sudo useradd -M -s /bin/false byedpi

echo "-> Downloading dependencies"
curl -L -o "$BIN_DIR/hev-socks5-tunnel" \
    https://github.com/heiher/hev-socks5-tunnel/releases/download/2.7.4/hev-socks5-tunnel-linux-x86_64
chmod +x "$BIN_DIR/hev-socks5-tunnel"

echo "-> Installing ByeDPI configuration"
cp -v "$SERVICE" /etc/systemd/system
cp -v byedpi.conf "$CONF_DIR"
cp -v hev-socks5-tunnel.yaml "$CONF_DIR"
cp -v byedpictl.sh "$BIN_DIR/byedpictl"

echo "-> Activating services"
systemctl enable --now "$SERVICE"
