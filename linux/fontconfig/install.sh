#!/bin/bash

set -e

echo "-> Prepare the directories."
mkdir -p -v ~/.config/fontconfig

echo "-> Installing the configuration."
cp -rv conf.d ~/.config/fontconfig

echo "-> fontconfig user configuration successfully installed."
echo "   Execute 'fc-cache -f' if cache is not updated automatically."
