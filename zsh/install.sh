#!/bin/bash
set -e

printf "\n-> Installing the configuration...\n"
ln -sfv "$(realpath .zshrc)" "$HOME/.zshrc"

printf "\nzsh configuration successfully installed, restart the shell to load the changes.\n"
