#!/bin/bash

set -e

CONFIG_DIR=~/.config/nvim

echo "-> Installing the Neovim configuration."
mkdir -p -v "$CONFIG_DIR"

target_path=$(realpath "./init.vim")
ln -sfv $target_path $CONFIG_DIR

echo "-> Neovim configuration successfully installed"
