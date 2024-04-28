#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"

echo "-> Preparing the configuration paths"
mkdir -p "$CONFIG_DIR"

echo "-> Installing the configuration."
echo "==> Linking the Alacritty config:"
ln -sfv $(realpath "./alacritty.toml") $CONFIG_DIR
echo "==> Linking the themes:"
ln -sfv $(realpath "./theme.toml") $CONFIG_DIR

echo "-> Alacritty configuration successfully installed"
