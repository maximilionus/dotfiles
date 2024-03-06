# Powershell 7 profile installation script.
#
# Elevated priveleges are required to create the symlink to profile

#Requires -Version 7.0
#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

$exec_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$profile_target = Join-Path -Path $exec_dir -ChildPath "Microsoft.PowerShell_profile.ps1"
$powershell_profile_dir = Split-Path -Parent $PROFILE

# Init pwsh profile dirs
if (-Not (Test-Path -Path $powershell_profile_dir)) {
    New-Item -ItemType Directory $powershell_profile_dir
    Write-Host -ForegroundColor black -BackgroundColor white "Created the PowerShell directory."
} else {
    Write-Host -ForegroundColor black -BackgroundColor white "PowerShell directory already exists."
}

# Install
Write-Host -ForegroundColor black -BackgroundColor white "Beginning the profile install."
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $profile_target -Force
Write-Host -ForegroundColor black -BackgroundColor green "PowerShell profile is successfully installed. Restart your shell to load the changes"
