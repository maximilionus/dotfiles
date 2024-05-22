#!/bin/bash

set -e

FONTCONFIG_USER=~/.config/fontconfig


echo "-> Prepare the directories."
mkdir -p -v $FONTCONFIG_USER

echo "-> Linking the configuration."
ln -svf $(realpath ./conf.d) $FONTCONFIG_USER

echo "-> fontconfig user configuration successfully installed."
echo "   Execute 'fc-cache -f' if cache is not updated automatically."
