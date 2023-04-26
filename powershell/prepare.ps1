# This script will prepare all the dependencies for profile install.

#Requires -Version 7.0
#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

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
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") # Update env to detect oh-my-posh in path
Add-MpPreference -ExclusionPath ((Get-Command oh-my-posh).Source)

Write-Host -ForegroundColor black -BackgroundColor green "Successfully installed and configured all required dependencies."
Write-Host -ForegroundColor black -BackgroundColor white "Next execute './install.ps1' to install the profile."
