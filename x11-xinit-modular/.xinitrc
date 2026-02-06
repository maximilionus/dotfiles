#!/bin/sh

prefix="/usr"
exec_prefix="${prefix}"
xrdb="xrdb"
xinitdir="/etc/X11/xinit"
xmodmap="xmodmap"

userxinitd="$HOME/.config/xinitd"
userresources="$HOME/.Xresources"
userresourcesd="$HOME/.config/xresourcesd"
usermodmap="$HOME/.Xmodmap"
sysresources="$xinitdir/.Xresources"
sysmodmap="$xinitdir/.Xmodmap"

if [ -f "$sysresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$sysresources"
    else
        "$xrdb" -nocpp -merge "$sysresources"
    fi
fi

if [ -f "$sysmodmap" ]; then
    "$xmodmap" "$sysmodmap"
fi

if [ -f "$userresources" ]; then
    if [ -x /usr/bin/cpp ] ; then
        "$xrdb" -merge "$userresources"
    else
        "$xrdb" -nocpp -merge "$userresources"
    fi
fi
if [ -d "$userresourcesd" ]; then
    for f in "$userresourcesd"/* ; do
        if [ -x /usr/bin/cpp ] ; then
            "$xrdb" -merge "$f"
        else
            "$xrdb" -nocpp -merge "$f"
        fi
    done
    unset f
fi

if [ -f "$usermodmap" ]; then
    "$xmodmap" "$usermodmap"
fi

if [ -d "$xinitdir"/xinitrc.d ] ; then
    for f in "$xinitdir/xinitrc.d"/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi
if [ -d "$userxinitd" ] ; then
    for f in "$userxinitd"/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
else
    echo "User directives are missing in $userxinitd, nothing to run." >2
    exit 1
fi
