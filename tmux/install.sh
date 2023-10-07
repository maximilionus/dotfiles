#!/bin/bash

set -e

echo "=> Installing the tmux configuration."

target_path=$(realpath "./tmux.conf")
link_path="$HOME/.tmux.conf"
echo -n "--> Linking the config: "
ln -sfv $target_path $link_path

echo "=> Tmux configuration successfully installed,"
echo "   restart all tmux sessions to load the changes."
