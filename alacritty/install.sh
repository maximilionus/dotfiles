#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"
SCRIPTS_DIR="$HOME/.local/bin"
SCRIPTS_SYS_DIR="/etc/profile.d"

echo "> Preparing the configuration paths"
mkdir -p "$CONFIG_DIR"
mkdir -p "$SCRIPTS_DIR"

echo "> Installing the configuration."

echo " > Linking the Alacritty config:"
ln -sfv $(realpath "./alacritty.toml") "$CONFIG_DIR"

echo " > Linking the themes:"
ln -sfv $(realpath "./theme_dark.toml") "$CONFIG_DIR"
ln -sfv $(realpath "./theme_light.toml") "$CONFIG_DIR"
cd $CONFIG_DIR
ln -sfv ./theme_dark.toml theme_selected.toml
cd -

echo " > Linking the scripts:"
echo "  > User scripts:"
for file in ./scripts/user/*.sh; do
    ln -sfv $(realpath "$file") "$SCRIPTS_DIR/$(basename $file .sh)"
done

echo "  > System scripts:"
echo "    Root required for this action."
for file in ./scripts/system/*.sh; do
    sudo ln -sfv $(realpath "$file") "$SCRIPTS_SYS_DIR"
done

echo "> Alacritty configuration successfully installed"
