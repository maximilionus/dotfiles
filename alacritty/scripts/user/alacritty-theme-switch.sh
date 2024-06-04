#!/bin/bash

CONFIG_DIR="$HOME/.config/alacritty"
THEME_SELECTED="theme_selected.toml"
THEME_DARK="theme_dark.toml"
THEME_LIGHT="theme_light.toml"


set_dark () {
    echo "Switching Alacritty theme to the dark mode."
    ln -sf "./$THEME_DARK" "$THEME_SELECTED"
}

set_light () {
    echo "Switching Alacritty theme to the light mode."
    ln -sf "./$THEME_LIGHT" "$THEME_SELECTED"
}


if [ ! -d "$CONFIG_DIR" ]; then
    echo "Alacritty configuration not found."
    exit 1
fi

cd "$CONFIG_DIR"

if [ -z "$1" ]; then
    # Auto theme switcher
    if [ "$THEME_SELECTED" -ef "$THEME_DARK" ]; then
        set_light
    else
        set_dark
    fi
else
    # Switch to provided value
    if [ "$1" == "light" ]; then
        if [ "$THEME_SELECTED" -ef "$THEME_DARK" ]; then
            set_light
        fi
    elif [ "$1" == "dark" ]; then
        if [ "$THEME_SELECTED" -ef "$THEME_LIGHT" ]; then
            set_dark
        fi
    fi

fi
