$ErrorActionPreference = "Stop"

function Require-Command([string]$Name) {
    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Missing required command: $Name"
    }
}

function Run-Native {
    param(
        [Parameter(Mandatory=$true)][string]$Command,
        [Parameter(ValueFromRemainingArguments=$true)][string[]]$Arguments
    )
    & $Command @Arguments
    if ($LASTEXITCODE -ne 0) { throw "$Command failed with exit code $LASTEXITCODE" }
}

Require-Command "codex"
Require-Command "git"
Require-Command "npx"

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$packDir = Split-Path -Parent $scriptDir
$version = "0.3.0"

Write-Host "`n==> Installing / refreshing Ponytail"
& codex plugin marketplace add DietrichGebert/ponytail 2>$null
& codex plugin marketplace upgrade ponytail 2>$null
& codex plugin add ponytail@ponytail 2>$null

Write-Host "`n==> Installing reviewed Anthropic frontend-design"
$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("fry-pack-" + [guid]::NewGuid().ToString("N"))
$clonePath = Join-Path $tempRoot "anthropic-skills"
New-Item -ItemType Directory -Force -Path $clonePath | Out-Null

try {
    Run-Native git -C $clonePath init -q
    Run-Native git -C $clonePath remote add origin https://github.com/anthropics/skills.git
    Run-Native git -C $clonePath fetch -q --depth 1 origin dbd4588f9e1033efb41dad4bef2f7947c8993d44
    Run-Native git -C $clonePath checkout -q FETCH_HEAD -- skills/frontend-design

    $skillsRoot = Join-Path $HOME ".agents\skills"
    New-Item -ItemType Directory -Force -Path $skillsRoot | Out-Null
    $dest = Join-Path $skillsRoot "frontend-design"
    if (Test-Path $dest) { Remove-Item -Path $dest -Recurse -Force }
    Copy-Item -Path (Join-Path $clonePath "skills\frontend-design") -Destination $dest -Recurse

    Write-Host "`n==> Installing Impeccable globally for Codex"
    Run-Native npx --yes impeccable@4.5.2 install --providers=codex --scope=global --no-hooks

    Write-Host "`n==> Installing FRY update skill"
    $updateDest = Join-Path $skillsRoot "fry-update"
    if (Test-Path $updateDest) { Remove-Item -Path $updateDest -Recurse -Force }
    Copy-Item -Path (Join-Path $packDir "skills\fry-update") -Destination $updateDest -Recurse
}
finally {
    if (Test-Path $tempRoot) { Remove-Item -Path $tempRoot -Recurse -Force }
}

Write-Host "`n==> Applying FRY Global Router"
$codexHome = if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME ".codex" }
New-Item -ItemType Directory -Force -Path $codexHome | Out-Null
$target = Join-Path $codexHome "AGENTS.md"
$router = Get-Content -Raw (Join-Path $packDir "global\AGENTS.md")
$start = "<!-- FRY-GLOBAL-START -->"
$end = "<!-- FRY-GLOBAL-END -->"

$existing = if (Test-Path $target) { Get-Content -Raw $target } else { "" }
$pattern = "(?s)\r?\n?<!-- FRY-GLOBAL-START -->.*?<!-- FRY-GLOBAL-END -->\r?\n?"
$cleaned = [regex]::Replace($existing, $pattern, "").TrimEnd()
$newContent = $cleaned + "`r`n`r`n" + $start + "`r`n" + $router.TrimEnd() + "`r`n" + $end + "`r`n"
Set-Content -Path $target -Value $newContent -Encoding UTF8

$state = @(
    "name: fry-new-project-development-pack",
    "version: $version",
    "source: https://github.com/labnnine/skills",
    "branch: fry-new-project-development-pack",
    "pack_path: packs/fry-new-project-development-pack"
)
Set-Content -Path (Join-Path $codexHome "fry-pack.yaml") -Value $state -Encoding UTF8

Write-Host "`n==> FRY $version installed"
Write-Host "Start a new Codex thread so the refreshed global AGENTS.md is loaded."
Write-Host "Open /hooks and review/trust Ponytail hooks if Codex asks."
Write-Host "New projects can now start directly from the task description."
