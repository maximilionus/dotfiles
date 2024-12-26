#!/bin/bash
set -e

TOOLCHAIN="/var/tmp/revanced-cli"

declare -A files=(
    ["revanced-cli.jar"]="https://github.com/ReVanced/revanced-cli/releases/download/v5.0.0/revanced-cli-5.0.0-all.jar"
    ["patches.rvp"]="https://github.com/ReVanced/revanced-patches/releases/download/v5.7.2/patches-5.7.2.rvp"
)


mkdir -p "$TOOLCHAIN"

for file_name in "${!files[@]}"; do
    echo "Downloading $file_name ..."
    curl -L -o "$TOOLCHAIN/$file_name" \
        "${files[$file_name]}"
    echo
done

echo
echo "Toolchain ready for use"
