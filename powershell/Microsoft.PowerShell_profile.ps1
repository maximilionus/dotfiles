Import-Module posh-git

Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None


# Env vars
$DOWNLOADS = (New-Object -ComObject Shell.Application).NameSpace('shell:Downloads').Self.Path


# Functions
function which([Parameter(Mandatory=$true)]$executable_name) {
    <#
        .DESCRIPTION
        Implementation of unix 'which' command

        .OUTPUTS
        System.String. Path to executable
    #>
    Write-Host (Get-Command $executable_name).Path
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
        Remove-Item -Recurse -Force -Confirm:$false -Path $file
    }
}


# Alias
Set-Alias ll ls

Invoke-Expression (&starship init powershell)
