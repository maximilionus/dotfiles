#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"

echo "> Removing the configuration."
echo " > Removing the configuration directory:"
rm -rfv "$CONFIG_DIR"

echo " > Removing the scripts:"
echo "   -----------------------------"
echo "   Root required for this action"
echo "   -----------------------------"
for file in ./scripts/bin/*.sh; do
    rm -rfv "/usr/local/bin/$(basename $file)"
done

for file in ./scripts/profile.d/*.sh; do
    rm -rfv "/etc/profile.d/$(basename $file)"
done

echo "> Alacritty configuration successfully removed"
