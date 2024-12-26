#!/bin/bash
set -e

TOOLCHAIN="/var/tmp/revanced-cli"

if [[ ! -d $TOOLCHAIN ]]; then
    echo "Revanced utilities not found."
    ./prepare.sh
fi

patch_tiktok() {
    echo "Patching TikTok ..."
    echo

    java -jar "$TOOLCHAIN/revanced-cli.jar" patch \
        --patches "$TOOLCHAIN/patches.rvp" \
        --enable "SIM spoof" \
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
