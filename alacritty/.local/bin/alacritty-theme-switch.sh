#!/bin/bash

set -e

CONFIG_DIR="$HOME/.config/alacritty"
THEME_SELECTED="theme_selected.toml"
THEME_DARK="theme_dark.toml"
THEME_LIGHT="theme_light.toml"


set_dark () {
    if diff -q "$THEME_SELECTED" "$THEME_DARK" > /dev/null; then
        echo "Theme is already set to dark."
        exit 0
    fi

    cp -f "./$THEME_DARK" "$THEME_SELECTED"
    echo "Switched Alacritty theme to dark mode."
}

set_light () {
    if diff -q "$THEME_SELECTED" "$THEME_LIGHT" > /dev/null; then
        echo "Theme is already set to light."
        exit 0
    fi

    echo "Switched Alacritty theme to light mode."
    cp -f "./$THEME_LIGHT" "$THEME_SELECTED"
}

set_autoswitch () {
    if diff -q "$THEME_SELECTED" "$THEME_DARK" > /dev/null; then
        set_light
    else
        set_dark
    fi
}


# Main
if [[ ! -d $CONFIG_DIR ]]; then
    echo "Alacritty configuration not found."
    exit 1
fi

cd "$CONFIG_DIR"

if [[ ! -f $THEME_SELECTED ]]; then
    set_dark
fi

case "$1" in
    light|l) set_light ;;
    dark|d)  set_dark ;;
    "")      set_autoswitch ;;
    *)       echo "Unknown command"; exit 1 ;;
esac
