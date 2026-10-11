---
name: fry-update
description: Sync or refresh the user's machine-global FRY Development Environment from its GitHub source of truth. Use when the user says update FRY, sync FRY, refresh the skills pack, install FRY on this machine, or check whether the local FRY environment is current.
---

# FRY Update

Source of truth:
https://github.com/labnnine/skills/tree/fry-new-project-development-pack/packs/fry-new-project-development-pack

## Rules

1. Treat this as a machine-global Codex environment operation, not a project-local change.
2. Preserve unrelated content in the user's global Codex AGENTS.md.
3. Preserve all project AGENTS.md files unless the user separately asks to bootstrap project-specific rules.
4. Read the current manifest and source registry before changing installed capabilities.
5. Core capabilities may be installed/refreshed by the FRY installer.
6. Approved optional capabilities are installed only when the current task genuinely needs them.
7. Pilot and tracked external tools must not be auto-installed.
8. Never bypass hook trust, credential prompts, paid-service confirmation, or other manual safety gates.

## Preferred execution

If this skill is running from a FRY pack checkout, run the platform-appropriate updater in scripts/.

If it is not running from a checkout, clone the source-of-truth branch to a temporary directory and run:

- macOS/Linux: bash scripts/install-fry.sh
- Windows PowerShell: powershell -ExecutionPolicy Bypass -File .\scripts\install-fry.ps1

Afterward, report:
- installed FRY version;
- Core capability status;
- any manual /hooks trust step still required;
- any approved optional capability installed for the current task.
