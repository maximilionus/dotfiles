#!/bin/bash

set -e

echo "-> Setting up the dependencies."
curl --create-dirs -L \
    -o ~/.zsh/antigen.zsh git.io/antigen

echo "-> Installing the configuration."
target_path=$(realpath "./zshrc")
link_path="$HOME/.zshrc"
ln -sfv $target_path $link_path

echo "zsh configuration successfully installed, restart shell to load the changes."
