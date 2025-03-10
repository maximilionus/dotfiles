#!/bin/bash
set -e

TOOLCHAIN="$HOME/.local/share/revanced-cli"

declare -A files=(
    ["revanced-cli.jar"]="https://github.com/ReVanced/revanced-cli/releases/download/v5.0.0/revanced-cli-5.0.0-all.jar"
    ["patches.rvp"]="https://github.com/ReVanced/revanced-patches/releases/download/v5.14.0/patches-5.14.0.rvp"
)


mkdir -p "$TOOLCHAIN"

for file_name in "${!files[@]}"; do
    echo "Downloading $file_name ..."
    curl --progress-bar -L -o "$TOOLCHAIN/$file_name" \
        "${files[$file_name]}"
    echo
done

echo
echo "Toolchain ready for use"
