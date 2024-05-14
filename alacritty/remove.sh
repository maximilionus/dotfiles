#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"
SCRIPTS_DIR="$HOME/.local/bin"

echo "-> Removing the configuration."
echo "==> Removing the configuration directory:"
rm -rfv "$CONFIG_DIR"

echo "==> Removing the scripts:"
rm -rfv "$SCRIPTS_DIR/alacritty_switch_theme.sh"

echo "-> Alacritty configuration successfully removed"
