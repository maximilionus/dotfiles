#!/bin/bash
set -e

TOOLCHAIN="/var/tmp/revanced-cli"

declare -A files=(
    ["revanced-cli.jar"]="https://github.com/ReVanced/revanced-cli/releases/download/v4.6.0/revanced-cli-4.6.0-all.jar"
    ["revanced-patches.jar"]="https://github.com/ReVanced/revanced-patches/releases/download/v4.17.0/revanced-patches-4.17.0.jar"
    ["revanced-integrations.apk"]="https://github.com/ReVanced/revanced-integrations/releases/download/v1.16.0/revanced-integrations-1.16.0.apk"
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
