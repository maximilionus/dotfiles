#!/bin/bash
set -e

TOOLCHAIN="$HOME/.local/share/revanced-cli"

if [[ ! -d $TOOLCHAIN ]]; then
    echo "Revanced toolchain not found!"
    ./install.sh
fi

patch_tiktok() {
    echo "- Patching TikTok"
    echo

    java -jar "$TOOLCHAIN/revanced-cli.jar" patch \
        --patches "$TOOLCHAIN/patches.rvp" \
        --enable "SIM spoof" \
        "$1"

    echo
    echo "Done"
}

patch_spotify() {
    echo "- Patching Spotify"
    echo

    java -jar "$TOOLCHAIN/revanced-cli.jar" patch \
        --patches "$TOOLCHAIN/patches.rvp" \
        --exclusive \
        --enable "Spoof signature" \
        "$1"

    echo
    echo "Done"
}

package_name=$( basename "$1" )
case $package_name in
    com.zhiliaoapp.musically*)
        patch_tiktok "$1"
        ;;
    com.spotify.music*|Spotify*)
        patch_spotify "$1"
        ;;
    *)
        echo "No supported apk provided to script"
        ;;
esac
