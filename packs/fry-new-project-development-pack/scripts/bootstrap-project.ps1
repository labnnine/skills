param(
    [string]$ProjectPath = (Get-Location).Path
)

$ErrorActionPreference = "Stop"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$packDir = Split-Path -Parent $scriptDir
$template = Join-Path $packDir "templates\PROJECT_AGENTS.md"

if (-not (Test-Path -Path $ProjectPath -PathType Container)) {
    throw "Project directory does not exist: $ProjectPath"
}

$target = Join-Path $ProjectPath "AGENTS.md"

if (Test-Path $target) {
    Write-Host "AGENTS.md already exists. Left unchanged: $target"
}
else {
    Copy-Item -Path $template -Destination $target
    Write-Host "Created: $target"
}

$marker = Join-Path $ProjectPath ".fry-development-pack.yaml"

if (Test-Path $marker) {
    Write-Host "Pack marker already exists. Left unchanged: $marker"
}
else {
    $markerContent = @(
        "pack: fry-new-project-development-pack",
        "version: 0.2.0",
        "routing:",
        "  engineering_restraint: ponytail",
        "  visual_direction: anthropic-frontend-design",
        "  ux_workflow_quality: impeccable",
        "optional_modules: []"
    )
    Set-Content -Path $marker -Value $markerContent -Encoding UTF8
    Write-Host "Created: $marker"
}

Write-Host ""
Write-Host "Project bootstrap complete."
Write-Host "Fill in AGENTS.md with this project's product truth and business rules."
Write-Host "Optional Impeccable project hook:"
Write-Host "npx impeccable install --providers=codex --scope=project"
