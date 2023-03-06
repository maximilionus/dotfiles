# This script will create the symlink to `yt-dlp.conf` from this directory in the `~/.config/` dir

$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$target_file = Join-Path -Path $script_dir -ChildPath "yt-dlp.conf"
$config_dir = Join-Path -Path $env:USERPROFILE -ChildPath ".config"
$link_path = Join-Path -Path $config_dir -ChildPath "yt-dlp.conf"
if (!(Test-Path $config_dir)) {
    New-Item -ItemType Directory -Path $config_dir
}
New-Item -ItemType SymbolicLink -Path $link_path -Target $target_file -Force
