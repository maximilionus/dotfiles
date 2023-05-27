# Powershell 7 profile installation script.
# Will install all dependencies, link required dependencies and profile.
#
# Elevated priveleges are required to add the oh-my-posh binary to the Defender
# exclusions list and create the symlinks to profile and user theme.

#Requires -Version 7.0
#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$real_profile_dir = "~/Documents/PowerShell"
$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$profile_source_path = Join-Path -Path $script_dir -ChildPath "Microsoft.PowerShell_profile.ps1"
$omp_theme_source_path = Join-Path -Path $script_dir -ChildPath "omp-themes\\mxml.omp.json"


Write-Host -ForegroundColor black -BackgroundColor white "Starting the installation"

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
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") # Update env to detect oh-my-posh in path
Add-MpPreference -ExclusionPath ((Get-Command oh-my-posh).Source) # Add oh-my-posh to Defender exclusions list

# Start oh-my-posh to set env vars and link theme
oh-my-posh init pwsh | Invoke-Expression
New-Item -ItemType SymbolicLink -Path "$env:POSH_THEMES_PATH\\$(Split-Path $omp_theme_source_path -leaf)" -Target $omp_theme_source_path -Force

Write-Host -ForegroundColor black -BackgroundColor green "Successfully installed and configured all required dependencies."

# Install
Write-Host -ForegroundColor black -BackgroundColor white "Beginning the profile install."
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $profile_source_path -Force
Write-Host -ForegroundColor black -BackgroundColor green "PowerShell profile is successfully installed. Restart your shell to load the changes"
