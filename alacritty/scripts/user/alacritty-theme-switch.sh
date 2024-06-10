#!/bin/bash

CONFIG_DIR="$HOME/.config/alacritty"
THEME_SELECTED="theme_selected.toml"
THEME_DARK="theme_dark.toml"
THEME_LIGHT="theme_light.toml"


set_dark () {
    cd "$CONFIG_DIR"

    if [ "$THEME_SELECTED" -ef "$THEME_DARK" ]; then
        echo "Theme is already set to dark."
        exit 0
    fi

    ln -sf "./$THEME_DARK" "$THEME_SELECTED"
    echo "Switched Alacritty theme to dark mode."
}

set_light () {
    cd "$CONFIG_DIR"

    if [ "$THEME_SELECTED" -ef "$THEME_LIGHT" ]; then
        echo "Theme is already set to light."
        exit 0
    fi

    echo "Switched Alacritty theme to light mode."
    ln -sf "./$THEME_LIGHT" "$THEME_SELECTED"
}

set_autoswitch () {
    cd "$CONFIG_DIR"

    if [ "$THEME_SELECTED" -ef "$THEME_DARK" ]; then
        set_light
    else
        set_dark
    fi
}


# Main
if [ ! -d "$CONFIG_DIR" ]; then
    echo "Alacritty configuration not found."
    exit 1
fi

if [ -z "$1" ]; then
    set_autoswitch
elif [ "$1" == "light" ]; then
    set_light
elif [ "$1" == "dark" ]; then
    set_dark
fi

