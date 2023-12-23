#!/bin/bash

set -e

echo "=> Setting up the dependencies."
echo -n "--> Installing the vim-plug package manager for ZSH: "
curl --progress-bar --create-dirs -L \
    -o ~/.vim/autoload/plug.vim \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "=> Installing the configuration."

target_path=$(realpath "./vimrc")
link_path="$HOME/.vimrc"
echo -n "--> Linking the vim config: "
ln -sfv $target_path $link_path

echo "=> vim configuration successfully installed,"
echo "   restart your shell to load the changes."
