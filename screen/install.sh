#!/bin/bash

set -e

echo "-> Installing the GNU Screen configuration."

target_path=$(realpath "./screenrc")
link_path="$HOME/.screenrc"
echo -n "==> Linking the config: "
ln -sfv $target_path $link_path

echo "-> GNU Screen configuration successfully installed,"
echo "   restart all GNU Screen sessions to load the changes."
