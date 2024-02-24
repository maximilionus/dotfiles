# Powershell 7 profile installation script.
#
# Elevated priveleges are required to create the symlink to profile

#Requires -Version 7.0
#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$profile_source_path = Join-Path -Path $script_dir -ChildPath "Microsoft.PowerShell_profile.ps1"

Write-Host -ForegroundColor black -BackgroundColor white "Starting the installation"
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
Install-Module posh-git -Scope CurrentUser -Force
winget install JanDeDobbeleer.OhMyPosh -s winget

# Install
Write-Host -ForegroundColor black -BackgroundColor white "Beginning the profile install."
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $profile_source_path -Force
Write-Host -ForegroundColor black -BackgroundColor green "PowerShell profile is successfully installed. Restart your shell to load the changes"
