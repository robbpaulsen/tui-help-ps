<#
.SYNOPSIS
	Revisa el historial de la linea de
    comando interactivamente.
.DESCRIPTION
    Interactivamente revisa el historial de
    la terminal, y asea global o local y selecciona
    el o los que te interesen o estes buscando.
.EXAMPLE
    PS1> Fuzzy-History.ps1 -global $True
.LINK
	https://gitlab.com/robbpaulsen/tui-help-ps
.NOTES
	Author: Robbpaulsen
#>

param(
    [parameter(Mandatory = $true)]
    [Boolean]
    $global
)

if ($global) {
    # Global history
    $history = [Microsoft.PowerShell.PSConsoleReadLine]::GetHistoryItems().CommandLine 
    # reverse the items so most recent is on top
    [array]::Reverse($history) 
    $history | Select-Object -Unique | Out-ConsoleGridView -OutputMode Multiple -Filter $line -Title "Historial Global"
    $theCommnad = $history
    Write-Host "${theCommand}" -NoNewline
} else {
    # Local history
    $history = Get-History | Sort-Object -Descending -Property Id -Unique | Select-Object CommandLine -ExpandProperty CommandLine 
    $history | Out-ConsoleGridView -OutputMode Multiple -Filter $line -Title "Historial de Terminal"
    $theCommnad = $history
    Write-Host "${theCommand}" -NoNewline
}