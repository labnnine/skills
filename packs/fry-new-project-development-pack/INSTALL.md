# Installation

FRY New Project Development Pack separates machine-wide setup from per-project bootstrap.

## 1. Install the Core stack once per machine

macOS / Linux:

    bash scripts/install-core.sh

Windows PowerShell:

    powershell -ExecutionPolicy Bypass -File .\scripts\install-core.ps1

The installer configures:

1. Ponytail through Codex's plugin marketplace.
2. Anthropic Frontend Design as a user-wide Agent Skill under ~/.agents/skills/frontend-design.
3. Impeccable user-wide for Codex, without installing a project hook.

Requirements: Codex CLI, Git, and Node.js / npx.

## 2. Complete the Codex trust step

Ponytail installs lifecycle hooks. After installation:

1. Open Codex.
2. Open /hooks.
3. Review and trust Ponytail's two lifecycle hooks.
4. Start a new thread.

Impeccable is installed globally without hooks because its Codex hook is project-local.

## 3. Bootstrap a new project

macOS / Linux:

    bash scripts/bootstrap-project.sh /path/to/project

Windows PowerShell:

    .\scripts\bootstrap-project.ps1 -ProjectPath "C:\path\to\project"

This copies the FRY project AGENTS.md template only if the project does not already have one. Existing project instructions are never overwritten.

## 4. Optional: enable Impeccable's project hook

Inside the project:

    npx impeccable install --providers=codex --scope=project

Then open /hooks in Codex and review/approve the project hook.

## 5. Verify

In a fresh Codex thread:

- confirm Ponytail reports its active mode;
- open /skills and confirm frontend-design and impeccable are available;
- for a UI project, try $impeccable or ask Codex to use the frontend-design skill.

## Updating

The installer refreshes the reviewed core components.

- Existing frontend-design is backed up before replacement.
- Ponytail and Impeccable use their upstream installers.
- Review upstream changes and changed hook definitions before trusting them.

See SOURCES.md for provenance and update policy.
