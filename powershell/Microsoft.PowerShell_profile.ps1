Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
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
