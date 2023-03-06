# This script will create the symlink to the profile config from this directory in `$PROFILE` path. Ensure that `~/Documents/PowerShell` directory already exists before running this script.

$script_dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$target_file = Join-Path -Path $script_dir -ChildPath "Microsoft.PowerShell_profile.ps1"
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $target_file -Force
