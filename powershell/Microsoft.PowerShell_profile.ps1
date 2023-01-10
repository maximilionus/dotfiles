Import-Module posh-git

Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None


# Env vars
$DOWNLOADS = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path


# Functions
function vactiva () {
    <#
        .DESCRIPTION
        Virtual environment manager for python in current directory. If '.venv' dir doesn't exist - creates it and activates the virtual environment for this shell.

        .OUTPUTS
        Command status and python path test
    #>
    $ErrorActionPreference = "Stop"  # Stop the function on first encountered exception

    if ( -Not (Test-Path -Path ".venv") ) {
        virtualenv .venv
    }

    .venv/Scripts/activate.ps1

    Write-Output "Python Virtual Environment - Activated", $((get-command python.exe).Path)
}

function which([Parameter(Mandatory=$true)]$executable_name) {
    <#
        .DESCRIPTION
        Implementation of unix 'which' command

        .OUTPUTS
        System.String. Path to executable
    #>
    Write-Host (Get-Command $executable_name).Path
}

function Video-Rescale(
    [Parameter(Mandatory=$true)][String]$source_video_path,
    [String]$DesiredResolution = "1280x720",
    [String]$DesiredFramerate = "60",
    [String]$DesiredQuality = "28",
    [String]$VolumeMultiplier = "1",
    [String]$FromTime,
    [String]$ToTime
) {
    <#
        .DESCRIPTION
        Rescale mp4 source video to any resolution using ffmpeg x264 encoder. Result will be saved in the same directory with postfix "_$DesiredResolution_$DesiredFramerate.mp4"

        .PARAMETER source_video_path
        Path to source video file that should be converted

        .PARAMETER DesiredResolution
        Resolution for output media in pixels in format WIDTHxHEIGH

        .PARAMETER DesiredFramerate
        Framerate (fps) for output media

        .PARAMETER DesiredQuality
        Set output media quality using the CRF. A lower value generally leads to higher quality. The range of the CRF scale is 0–51

        .PARAMETER VolumeMultiplier
        Audio tracks volume multiplier using the AAC codec; Default value (1) == no changes to audio tracks codec

        .PARAMETER FromTime
        Cut video starting point to this time. Should be provided in second or in format "HH:MM:SS"

        .PARAMETER ToTime
        Cut video ending point to this time. Should be provided in second or in format "HH:MM:SS"
    #>
    $output_path = $source_video_path + '_' + $DesiredResolution + '_' + $DesiredFramerate + '.mp4'

    # Volume modifiers
    if ($VolumeMultiplier -eq "1") {
        $audio_args = "-c:a", "copy"
    } else {
        $audio_args = "-c:a", "aac", "-filter:a", "volume=$VolumeMultiplier"
    }

    # Time cut modifiers
    $time_args = @()
    if ($FromTime -ne "") {
        $time_args += "-ss", $FromTime
    }

    if ($ToTime -ne "") {
        $time_args += "-to", $ToTime
    }

    $ffmpeg_params = "-s", $DesiredResolution, "-filter:v", "fps=$DesiredFramerate", "-c:v", "libx264", "-crf", $DesiredQuality
    $ffmpeg_params += $audio_args += $time_args

    ffmpeg.exe -i $source_video_path $ffmpeg_params $output_path
}

function rmrf(
    [Parameter(Mandatory=$true)]$files_to_remove
) {
    <#
        .DESCRIPTION
        Unix-style 'rm -rf' command implementation

        .PARAMETER files_to_remove
        Files to be removed, separated by 'space'
    #>
    foreach($file in $files_to_remove) {
        Remove-Item -Recurse -Force -Confirm:$false -Path $file
    }
}


# Alias
Set-Alias ll ls

Invoke-Expression (&starship init powershell)
