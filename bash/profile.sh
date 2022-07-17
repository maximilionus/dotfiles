#!/bin/bash

function video_downscale_720_30 () {
    ffmpeg.exe -i "$1" -s 1280x720 -filter:v fps=30 "$1_720.mp4"
}

function video_to_telegram_sticker() {
    edited_video_path="./converted_webm"
    mkdir -p $edited_video_path
    ffmpeg -i "$1" -framerate 30 -c:v libvpx-vp9 -an -vf scale=512:512 -pix_fmt yuva420p "$edited_video_path/$1_sticker.webm"
}

function vactiva () {
    if [[ ! -d ".venv" ]] ; then
        virtualenv .venv
    fi;

    case "$(uname -s)" in
        Linux*|Darwin*) source ".venv/bin/activate";;
        *)              source ".venv/Scripts/activate";;
    esac;

    printf "Python Virtual Environment - Activated\nPYTHON: %s\n" "$(which python)"
}


alias ll="ls -lah"
