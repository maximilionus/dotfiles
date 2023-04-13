# This script will create the symlink to the profile config from this directory in `$PROFILE` path. Ensure that `~/Documents/PowerShell` directory already exists before running this script.

#Requires -Version 7.0
#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$profile_to_install_file = Join-Path -Path $script_dir -ChildPath "Microsoft.PowerShell_profile.ps1"
$profile_dir = "~/Documents/PowerShell"

Write-Host -ForegroundColor black -BackgroundColor white "Beginning the setup."

if (-Not (Test-Path -Path $profile_dir)) {
    New-Item -ItemType Directory $profile_dir
    Write-Host -ForegroundColor black -BackgroundColor white "Created the PowerShell directory."
} else {
    Write-Host -ForegroundColor black -BackgroundColor white "PowerShell directory already exists."
}

Write-Host -ForegroundColor black -BackgroundColor white "Beginning the extras install. User input MAY BE required!"
Install-Module "posh-git"
winget install JanDeDobbeleer.OhMyPosh -s winget
Add-MpPreference -ExclusionPath ((Get-Command oh-my-posh).Source)
Write-Host -ForegroundColor black -BackgroundColor white "Successfully installed and configured all required dependencies."

Write-Host -ForegroundColor black -BackgroundColor white "Beginning the profile install."
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $profile_to_install_file -Force
Write-Host -ForegroundColor black -BackgroundColor white "PowerShell profile is successfully installed. Restart your shell to load the changes"
