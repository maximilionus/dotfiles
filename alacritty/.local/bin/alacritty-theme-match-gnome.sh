#!/bin/bash

set -e

SCRIPT_THEME_SWITCHER="alacritty-theme-switch.sh"


if ! command -v gsettings &> /dev/null; then
    echo "Non GNOME environment detected, exiting."
    exit 1
fi

if ! command -v "$SCRIPT_THEME_SWITCHER" &> /dev/null; then
    echo "Theme switching script not detected in \$PATH, exiting."
    exit 1
fi

gnome_prefers=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ $gnome_prefers == "'prefer-dark'" ]]; then
    $SCRIPT_THEME_SWITCHER dark
else
    $SCRIPT_THEME_SWITCHER light
fi
