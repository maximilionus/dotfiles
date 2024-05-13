#!/bin/bash

sed -i --follow-symlinks 's/dark.toml/light.toml/' ~/.config/alacritty/alacritty.toml && exit 0
sed -i --follow-symlinks 's/light.toml/dark.toml/' ~/.config/alacritty/alacritty.toml
