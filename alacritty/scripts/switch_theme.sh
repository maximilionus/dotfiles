#!/bin/bash

CONFIG_DIR="$HOME/.config/alacritty"
THEME_SELECTED="theme_selected.toml"
THEME_DARK="theme_dark.toml"
THEME_LIGHT="theme_light.toml"

if [ ! -d "$CONFIG_DIR" ]; then
    echo "Alacritty configuration not found."
    exit 1
fi

cd "$CONFIG_DIR"
if [ "$THEME_SELECTED" -ef "$THEME_DARK" ]; then
    echo "Switching Alacritty theme to the light mode."
    ln -sf "./$THEME_LIGHT" "$THEME_SELECTED"
else
    echo "Switching Alacritty theme to the dark mode."
    ln -sf "./$THEME_DARK" "$THEME_SELECTED"
fi
