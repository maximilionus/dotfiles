#!/bin/bash

set -e

KITTY_CONFIG_DIR="$HOME/.config/kitty"

echo "-> Preparing the configuration paths"
mkdir -p "$KITTY_CONFIG_DIR"

echo "-> Installing the configuration."
echo "==> Linking the Kitty config:"
ln -sfv $(realpath "./kitty.conf") $KITTY_CONFIG_DIR
echo "==> Linking the Kitty themes:"
ln -sfv $(realpath "./theme-dark.conf") $KITTY_CONFIG_DIR
ln -sfv $(realpath "./theme-light.conf") $KITTY_CONFIG_DIR

echo "-> Kitty configuration successfully installed"
