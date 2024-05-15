#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"
SCRIPTS_DIR="$HOME/.local/bin"

echo "-> Removing the configuration."
echo "==> Removing the configuration directory:"
rm -rfv "$CONFIG_DIR"

echo "==> Removing the scripts:"

for file in ./scripts/*.sh; do
    rm -rfv "$SCRIPTS_DIR/$(basename $file .sh)"
done

echo "-> Alacritty configuration successfully removed"
