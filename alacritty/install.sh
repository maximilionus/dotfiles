#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"
SCRIPTS_DIR="$HOME/.local/bin"

echo "-> Preparing the configuration paths"
mkdir -p "$CONFIG_DIR"
mkdir -p "$SCRIPTS_DIR"

echo "-> Installing the configuration."

echo "==> Linking the Alacritty config:"
ln -sfv $(realpath "./alacritty.toml") "$CONFIG_DIR"

echo "==> Linking the themes:"
ln -sfv $(realpath "./theme_dark.toml") "$CONFIG_DIR"
ln -sfv $(realpath "./theme_light.toml") "$CONFIG_DIR"
cd $CONFIG_DIR
ln -sfv ./theme_dark.toml theme_selected.toml
cd -

echo "==> Linking the scripts:"
ln -sfv $(realpath "./scripts/switch_theme.sh") "$SCRIPTS_DIR/alacritty_switch_theme"

echo "-> Alacritty configuration successfully installed"
