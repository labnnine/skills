$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Missing required command: git"
}

$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("fry-update-" + [guid]::NewGuid().ToString("N"))
try {
    & git clone -q --depth 1 --branch fry-new-project-development-pack --filter=blob:none --sparse https://github.com/labnnine/skills.git $tempRoot
    if ($LASTEXITCODE -ne 0) { throw "Failed to clone FRY source of truth." }

    & git -C $tempRoot sparse-checkout set packs/fry-new-project-development-pack
    if ($LASTEXITCODE -ne 0) { throw "Failed to materialize FRY pack." }

    $installer = Join-Path $tempRoot "packs\fry-new-project-development-pack\scripts\install-fry.ps1"
    & powershell -ExecutionPolicy Bypass -File $installer
    if ($LASTEXITCODE -ne 0) { throw "FRY installer failed." }
}
finally {
    if (Test-Path $tempRoot) { Remove-Item -Path $tempRoot -Recurse -Force }
}
