#!/bin/bash

function video_rescale () {
    local source_video_path="${1}"
    local desired_resolution="${RES:=1280x720}"
    local desired_framerate=${FRM:=30}
    local desired_quality=${QLT:=28}
    local volume_multiplier=${VLM:=1}
    local additional_args=${ARG}

    local output_path="${source_video_path}_${desired_resolution}_${desired_framerate}.mp4"

    if [ "$volume_multiplier" = "1" ]; then
        local audio_args=("-c:a" "copy")
    else
        local audio_args=("-c:a" "aac" "-filter:a" "volume=${volume_multiplier}")
    fi

    local ffmpeg_params=("-s" "${desired_resolution}" "-filter:v" "fps=${desired_framerate}" "-c:v" "libx264" "-crf" "${desired_quality}")
    ffmpeg_params+=("${audio_args[@]}""${additional_args[@]}")

    local final_args=("-i" "$source_video_path" "${ffmpeg_params[@]}" "$output_path")

    ffmpeg ${final_args}
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
