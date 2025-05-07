<#
.SYNOPSIS
	Obten Ayuda de Temas Aanzados en PowerShell
.DESCRIPTION
    Interactivamente revisa los modulos de ayuda y temas
    "about" para consultar desde la terminal
.EXAMPLE
    PS1> Help-Plz.ps1
.LINK
	https://gitlab.com/robbpaulsen/tui-help-ps
.NOTES
	Author: Robbpaulsen
#>

Get-Help about* | Select-Object Name | 
Out-ConsoleGridView -Title 'How The Fuq is this Done ?' -OutputMode Single | 
Get-Help