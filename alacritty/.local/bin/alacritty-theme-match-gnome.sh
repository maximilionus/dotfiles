#!/bin/bash

set -e

THEME_SWITCHER="alacritty-theme-switch.sh"


if ! command -v gsettings &> /dev/null; then
    echo "Non GNOME environment detected, exiting."
    exit 1
fi

if ! command -v "$THEME_SWITCHER" &> /dev/null; then
    echo "Theme switching script not detected in \$PATH, exiting."
    exit 1
fi

gnome_prefers=$(gsettings get org.gnome.desktop.interface color-scheme)
if [[ $gnome_prefers == "'prefer-dark'" ]]; then
    $THEME_SWITCHER dark
else
    $THEME_SWITCHER light
fi
