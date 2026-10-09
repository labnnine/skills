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
    if ($LASTEXITCODE -ne 0) {
        throw "$Command failed with exit code $LASTEXITCODE"
    }
}

Require-Command "codex"
Require-Command "git"
Require-Command "npx"

Write-Host ""
Write-Host "==> Installing / refreshing Ponytail"
Run-Native codex plugin marketplace add DietrichGebert/ponytail
Run-Native codex plugin add ponytail@ponytail

Write-Host ""
Write-Host "==> Installing / refreshing Anthropic frontend-design"
$tempRoot = Join-Path ([System.IO.Path]::GetTempPath()) ("fry-pack-" + [guid]::NewGuid().ToString("N"))
$clonePath = Join-Path $tempRoot "anthropic-skills"
New-Item -ItemType Directory -Force -Path $tempRoot | Out-Null

try {
    Run-Native git clone --depth 1 --filter=blob:none --sparse https://github.com/anthropics/skills.git $clonePath
    Run-Native git -C $clonePath sparse-checkout set skills/frontend-design

    $skillsRoot = Join-Path $HOME ".agents\skills"
    $dest = Join-Path $skillsRoot "frontend-design"
    New-Item -ItemType Directory -Force -Path $skillsRoot | Out-Null

    if (Test-Path $dest) {
        $stamp = Get-Date -Format "yyyyMMdd-HHmmss"
        $backup = Join-Path $skillsRoot ("frontend-design.backup-" + $stamp)
        Move-Item -Path $dest -Destination $backup
        Write-Host "Backed up existing frontend-design to: $backup"
    }

    Copy-Item -Path (Join-Path $clonePath "skills\frontend-design") -Destination $dest -Recurse
    Write-Host "Installed frontend-design to: $dest"
}
finally {
    if (Test-Path $tempRoot) {
        Remove-Item -Path $tempRoot -Recurse -Force
    }
}

Write-Host ""
Write-Host "==> Installing / refreshing Impeccable globally for Codex"
Run-Native npx --yes impeccable install --providers=codex --scope=global --no-hooks

Write-Host ""
Write-Host "==> Core install complete"
Write-Host "Next steps in Codex:"
Write-Host "1. Open /hooks and review/trust Ponytail's two lifecycle hooks."
Write-Host "2. Start a new thread."
Write-Host "3. Open /skills and verify frontend-design and impeccable are available."
Write-Host ""
Write-Host "Optional per-project Impeccable hook:"
Write-Host "npx impeccable install --providers=codex --scope=project"
