$ErrorActionPreference = "Stop"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Write-Host "install-core.ps1 is retained for compatibility; delegating to install-fry.ps1."
& powershell -ExecutionPolicy Bypass -File (Join-Path $scriptDir "install-fry.ps1")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
