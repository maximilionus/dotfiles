oh-my-posh init pwsh --config ~/.oh-my-posh/themes/bubblesextra.omp.json | Invoke-Expression

Import-Module Terminal-Icons
Import-Module posh-git

Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit
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

function video-rescale(
    [Parameter(Mandatory=$true)][String]$source_video_path,
    [String]$desired_resolution = "1280x720",
    [String]$desired_framerate = "30",
    [String]$desired_quality = "28",
    [String]$volume_multiplier = "1",
    [String]$additional_args
) {
    <#
        .DESCRIPTION
        Rescale mp4 source video to any resolution using ffmpeg x264 encoder. Result will be saved in the same directory with postfix "_$desired_resolution_$desired_framerate.mp4"

        .PARAMETER source_video_path
        Path to source video file that should be converted

        .PARAMETER desired_resolution
        Resolution for output media in pixels in format WIDTHxHEIGH

        .PARAMETER desired_framerate
        Framerate (fps) for output media

        .PARAMETER desired_quality
        Set output media quality using the CRF. A lower value generally leads to higher quality. The range of the CRF scale is 0–51

        .PARAMETER volume_multiplier
        Audio tracks volume multiplier using the AAC codec; Default value (1) == no changes to audio tracks codec

        .PARAMETER additional_args
        Additional arguments to be passed to ffmpeg command call
    #>
    $output_path = $source_video_path + '_' + $desired_resolution + '_' + $desired_framerate + '.mp4'

    if ($volume_multiplier -eq "1") {
        $audio_args = "-c:a", "copy"
    } else {
        $audio_args = "-c:a", "aac", "-filter:a", "volume=$volume_multiplier"
    }

    $ffmpeg_params = "-s", $desired_resolution, "-filter:v", "fps=$desired_framerate", "-c:v", "libx264", "-crf", $desired_quality
    $ffmpeg_params += $audio_args += $additional_args.Split(' ')

    ffmpeg.exe -i $source_video_path $ffmpeg_params $output_path
}

function video-to-telegram-sticker(
    [Parameter(Mandatory=$true)]$source_video_path
) {
    <#
        .DESCRIPTION
        Convert any video to telegram video sticker (.webm-vp9-30fps-512px)

        .PARAMETER source_video_path
        Path to source video file that should be converted
    #>
    $ErrorActionPreference = "Stop"

    $source_video_dir = Split-Path $source_video_path -Parent
    $source_video_name = Split-Path $source_video_path -Leaf
    $edited_video_dir = Join-Path -Path $source_video_dir -Child "converted_webm\"

    New-Item -ItemType Directory -Force -Path $edited_video_dir

    ffmpeg -i $source_video_path -framerate 30 -c:v libvpx-vp9 -an -pix_fmt yuva420p -fs 256K $(Join-Path -Path $edited_video_dir -Child ($source_video_name + '_sticker.webm'))
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
        Remove-Item -Verbose -Recurse -Force -Confirm:$false -Path $file
    }
}

function poshpoup() {
    <#
        .DESCRIPTION
        Updater for this powershell profile. Currently based on github-gist link. If any updates available - function will ask to install them. WARNING: Manual powershell profile reload required after updating - `PS> . $PROFILE`
    #>
    $ErrorActionPreference = "Stop"  # Stop the function on first encountered exception
    $profile_path = $PROFILE
    $web_temp_profile_path = $env:TEMP + '\MXML_PowerShell_profile.temp.ps1'
    $web_url = "https://github.com/maximilionus/configs/raw/master/powershell/Microsoft.PowerShell_profile.ps1"

    # Save web version to temp dir
    iwr -Uri $web_url -OutFile $web_temp_profile_path

    # Calculate SHA-256 hashes for installed and downloaded profiles
    $temp_hash = (Get-FileHash -Algorithm SHA256 $web_temp_profile_path).Hash
    $installed_hash = (Get-FileHash -Algorithm SHA256 $profile_path).Hash

    # Upgrade procedure
    if ( $temp_hash -ne $installed_hash ) {
        $decision = $Host.UI.PromptForChoice('🔃 New updates for this PowerShell profile detected', '❓ Install them?', ('✔️ &Yes', '❌ &No'), 1)
        if ($decision -eq 0) {
            cpi -Force -Path $web_temp_profile_path -Destination $profile_path
            Write-Host -ForegroundColor Green '✅ Powershell profile was successfully upgraded to latest version. To activate the latest changes, you should restart the shell or run "PS> . $PROFILE"'
        } else {
            Write-Host -ForegroundColor Red '❌ Updating process was cancelled by user'
        }
    } else {
        Write-Host -ForegroundColor Green "❎ You're up-to-date 👍"
    }

    # Clean temp files
    Remove-Item -Force -Confirm:$false $web_temp_profile_path
}


# Alias
Set-Alias ll ls
