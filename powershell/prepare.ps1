# Powershell 7 profile pre-installation script.
# Will install all dependencies and prepare the file structure.
#
# Elevated priveleges are required to add the oh-my-posh binary to the Defender
# exclusions list and create the symlinks to profile and user theme.

#Requires -Version 7.0
#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$real_profile_dir = "~/Documents/PowerShell"


# Init pwsh profile dirs
if (-Not (Test-Path -Path $real_profile_dir)) {
    New-Item -ItemType Directory $real_profile_dir
    Write-Host -ForegroundColor black -BackgroundColor white "Created the PowerShell directory."
} else {
    Write-Host -ForegroundColor black -BackgroundColor white "PowerShell directory already exists."
}

# Install deps
Write-Host -ForegroundColor black -BackgroundColor white "Beginning the extras install. User input MAY BE required!"
Install-Module "posh-git"
winget install JanDeDobbeleer.OhMyPosh -s winget

Write-Host -ForegroundColor black -BackgroundColor green "Preparations are complete. Please restart the shell and run the 'install.ps1' script."
