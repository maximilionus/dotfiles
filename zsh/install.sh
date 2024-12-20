#!/bin/bash
set -e

printf "Installing the configuration\n\n"
ln -sfv "$(realpath .zshrc)" "$HOME/.zshrc"
ln -sfv "$(realpath .p10k.zsh)" "$HOME/.p10k.zsh"

printf "\nzsh configuration successfully installed, restart the shell to load the changes.\n"
