#!/bin/bash

set -e

ALACRITTY_CONFIG_DIR="$HOME/.config/alacritty"
ALACRITTY_THEMES_DIR="$ALACRITTY_CONFIG_DIR/themes"

echo "=> Preparing the configuration paths"
mkdir -p "$ALACRITTY_CONFIG_DIR"

echo "=> Installing the configuration."
echo "--> Linking the alacritty config: "
ln -sfv $(realpath "./alacritty.toml") $ALACRITTY_CONFIG_DIR

echo "=> Setting up the additions."
echo "--> Installing additional themes for alacritty: "
git clone https://github.com/alacritty/alacritty-theme.git "$ALACRITTY_THEMES_DIR"

echo "=> Alacritty configuration successfully installed"
