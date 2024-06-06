#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"
SCRIPTS_DIR="$HOME/.local/bin"
SCRIPTS_SYS_DIR="/etc/profile.d"

echo "> Removing the configuration."
echo " > Removing the configuration directory:"
rm -rfv "$CONFIG_DIR"

echo " > Removing the scripts:"
echo "  > User scripts:"
for file in ./scripts/user/*.sh; do
    rm -rfv "$SCRIPTS_DIR/$(basename $file .sh)"
done

echo "  > System scripts:"
echo "    Root required for this action."
for file in ./scripts/system/*.sh; do
    sudo rm -rfv "$SCRIPTS_SYS_DIR/$(basename $file)"
done

echo "> Alacritty configuration successfully removed"
