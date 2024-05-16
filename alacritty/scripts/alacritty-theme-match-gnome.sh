#!/bin/bash

SCRIPT_THEME_SWITCHER="alacritty-theme-switch"

# Checks
if ! command -v gsettings &> /dev/null; then
    echo "Non GNOME environment detected, exiting."
    exit 1
fi

if ! command -v "$SCRIPT_THEME_SWITCHER" &> /dev/null; then
    echo "Theme switching script not detected in \$PATH, exiting."
    exit 1
fi

# Set theme
gnome_prefers=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ $gnome_prefers == "'default'" ]]; then
    # Light
    $SCRIPT_THEME_SWITCHER light
else
    # Dark
    $SCRIPT_THEME_SWITCHER dark
fi
