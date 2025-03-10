#!/bin/bash
set -e

TOOLCHAIN="$HOME/.local/share/revanced-cli"


echo "Removing the toolchain..."
rm -rfv "$TOOLCHAIN"
echo "Done"
