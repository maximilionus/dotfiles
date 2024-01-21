#!/bin/bash

set -e

RANGER_CONFIG_DIR="$HOME/.config/ranger"

echo "-> Preparing the configuration paths"
mkdir -p "$RANGER_CONFIG_DIR"

echo "-> Installing the configuration."
echo "==> Linking the ranger config:"
ln -sfv $(realpath "./rc.conf") $RANGER_CONFIG_DIR

echo "-> ranger configuration successfully installed"
