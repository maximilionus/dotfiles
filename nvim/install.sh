#!/bin/bash

set -e

CONFIG_DIR=~/.config/nvim

echo "-> Installing the Neovim lua configuration"

mkdir -p -v "$CONFIG_DIR"
ln -sfv $(realpath "./init.lua") $CONFIG_DIR
ln -sfv $(realpath "./lua") $CONFIG_DIR

echo "-> Neovim configuration successfully installed"
