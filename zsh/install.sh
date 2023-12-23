#!/bin/bash

set -e

echo "=> Setting up the dependencies."
echo -n "--> Installing the Antigen package manager for ZSH: "
curl --progress-bar --create-dirs -L \
    -o ~/.zsh/antigen.zsh \
    git.io/antigen

echo "=> Installing the configuration."
target_path=$(realpath "./zshrc")
link_path="$HOME/.zshrc"
echo -n "--> Linking the ZSH config: "
ln -sfv $target_path $link_path

echo "=> ZSH configuration successfully installed,"
echo "   restart your shell to load the changes."
