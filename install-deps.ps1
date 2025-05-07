# Instalacion de modulo #
# ########################

# Start timing the execution
$stopWatch = [system.diagnostics.stopwatch]::startNew()

Clear-Host

$IsAdmin = (New-Object System.Security.Principal.WindowsPrincipal([System.Security.Principal.WindowsIdentity]::GetCurrent())).IsInRole([System.Security.Principal.WindowsBuiltInRole]:: Administrator)
if (-not $IsAdmin) {
    Write-Output "`n⚠️ Necesitas ejecutar el script como Administrador y/o Desbloquear el Script." -ForegroundColor Green -BackgroundColor Black
    exit 1
}

Write-Output "`n⏳ Verificando e Instalando las dependencias" -ForegroundColor Yellow -NoNewline

try {
    if (-not (Get-Module -ListAvailable -Name Microsoft.PowerShell.ConsoleGuiTools)) {
        Install-Module -Name Microsoft.PowerShell.ConsoleGuiTools -Repository PSGallery -Scope CurrentUser -Force
    }
    Import-Module -Name Microsoft.PowerShell.ConsoleGuiTools -Scope Local -Force
} catch {
    "`n⚠️ Error in line $($Error[0].InvocationInfo.ScriptLineNumber): $($Error[0])"
}

try {
    if (-not (Get-PSResource -Name Get-PSResource -Name Microsoft.PowerShell.ConsoleGuiTools)) {
        Install-PSResource -Name Microsoft.PowerShell.ConsoleGuiTools -Repository PSGallery -Scope CurrentUser -Prerelease
    }
} catch {
    "`n⚠️ Error in line $($Error[0].InvocationInfo.ScriptLineNumber): $($Error[0])"
}

[int]$elapsed = $stopWatch.Elapsed.TotalSeconds
Write-Output "`n✅ Se resolvieron las dependencias en $($elapsed)s" -ForegroundColor Green