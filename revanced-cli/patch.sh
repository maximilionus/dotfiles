#!/bin/bash
set -e

TOOLCHAIN="/var/tmp/revanced-cli"

if [[ ! -d $TOOLCHAIN ]]; then
    echo "Revanced utilities not found, use prepare.sh first"
    ./prepare.sh
fi

patch_tiktok() {
    echo "Patching TikTok ..."
    echo

    java -jar "$TOOLCHAIN/revanced-cli.jar" patch \
        --patch-bundle "$TOOLCHAIN/revanced-patches.jar" \
        --merge "$TOOLCHAIN/revanced-integrations.apk" \
        --include "Remember clear display" \
        --include "Playback speed" \
        --include "Downloads" \
        --include "Show seekbar" \
        --include "Feed filter" \
        --include "Settings" \
        --include "SIM spoof" \
        --include "Fix Google login" \
        --include "Disable login requirement" \
        $1

    echo
    echo "Done"
}

package_name=$( basename $1 )
case $package_name in
    com.zhiliaoapp.musically*)
        patch_tiktok $1
        ;;
    *)
        echo "No supported apk provided to script"
        ;;
esac
