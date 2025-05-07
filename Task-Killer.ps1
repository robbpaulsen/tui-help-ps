<#
.SYNOPSIS
	Termina Procesos
.DESCRIPTION
    Interactivamente revisa los preocesos ejecutandose
    y escoge uno o mas para terminarlos
.EXAMPLE
    PS1> Task-Killer.ps1
.LINK
	https://gitlab.com/robbpaulsen/tui-help-ps
.NOTES
	Author: Robbpaulsen
#>

Get-Process | Out-GridView -OutputMode Multiple | Stop-Process -Force