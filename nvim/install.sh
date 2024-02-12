#!/bin/bash

set -e

CONFIG_DIR=~/.config/nvim

echo "-> Installing the Neovim configuration."
mkdir -p -v "$CONFIG_DIR"

target_path=$(realpath "./init.vim")
ln -sfv $target_path $CONFIG_DIR

echo "-> Installing the plugin manager."
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs --progress-bar \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "-> Neovim configuration successfully installed"
