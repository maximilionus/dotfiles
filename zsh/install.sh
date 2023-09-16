#!/bin/bash

set -e

# Install antigen
echo "=> Setting up the dependencies."
curl --create-dirs -L git.io/antigen -o "$HOME/.zsh/antigen.zsh"

# Link the config
target_path=$(realpath "./zshrc")
link_path="$HOME/.zshrc"

ln -sfv $target_path $link_path

echo "=> ZSH configuration successfully installed,"
echo "   restart your shell to load the changes."
