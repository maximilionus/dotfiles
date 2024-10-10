#!/bin/bash
set -e

SERVICE="byedpi.service"

echo "-> Installing ByeDPI configuration"
cp -v $SERVICE /etc/systemd/system
cp -v byedpi.conf /etc/
cp -v byedpictl.sh /usr/local/bin

echo "-> Activating services"
systemctl enable --now $SERVICE
