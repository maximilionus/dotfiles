#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"

echo "> Preparing the configuration paths"
mkdir -p "$CONFIG_DIR"

echo "> Installing the configuration."
echo " > Linking the Alacritty config:"
ln -sfv $(realpath "./alacritty.toml") "$CONFIG_DIR"

echo " > Linking the themes:"
ln -sfv $(realpath "./theme_dark.toml") "$CONFIG_DIR"
ln -sfv $(realpath "./theme_light.toml") "$CONFIG_DIR"
cd $CONFIG_DIR
ln -sfv ./theme_dark.toml theme_selected.toml
cd -

echo " > Linking the system-wide scripts:"
echo "   -----------------------------"
echo "   Root required for this action"
echo "   -----------------------------"
for file in ./scripts/bin/*.sh; do
    ln -sfv $(realpath "$file") /usr/local/bin/
done

for file in ./scripts/profile.d/*.sh; do
    ln -sfv $(realpath "$file") /etc/profile.d/
done

echo "> Alacritty configuration successfully installed"
