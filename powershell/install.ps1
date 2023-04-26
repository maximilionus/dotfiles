# This script will create the symlink to the profile config from this directory in `$PROFILE` path. Ensure that `~/Documents/PowerShell` directory already exists before running this script.

#Requires -Version 7.0
#Requires -RunAsAdministrator
$ErrorActionPreference = "Stop"

# Install
$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$profile_to_install_file = Join-Path -Path $script_dir -ChildPath "Microsoft.PowerShell_profile.ps1"

Write-Host -ForegroundColor black -BackgroundColor white "Beginning the profile install."
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $profile_to_install_file -Force
Write-Host -ForegroundColor black -BackgroundColor green "PowerShell profile is successfully installed. Restart your shell to load the changes"
