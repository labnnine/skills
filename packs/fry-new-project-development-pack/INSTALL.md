# Installation

FRY v0.3 is machine-global. Install it once on each Mac or Windows machine that runs Codex.

## Install from a FRY pack checkout

macOS / Linux:

    bash scripts/install-fry.sh

Windows PowerShell:

    powershell -ExecutionPolicy Bypass -File .\scripts\install-fry.ps1

The installer:

1. installs / refreshes Ponytail;
2. installs the reviewed Anthropic frontend-design skill user-wide;
3. installs Impeccable user-wide for Codex without a project hook;
4. installs the FRY-owned fry-update skill;
5. inserts or refreshes a delimited FRY block in the user's global Codex AGENTS.md without deleting unrelated global instructions;
6. writes the installed version to the Codex home directory.

Default locations:

- Global instructions: `$CODEX_HOME/AGENTS.md` (normally `~/.codex/AGENTS.md`)
- FRY state: `$CODEX_HOME/fry-pack.yaml`
- User-wide skills: `~/.agents/skills/`

## Manual trust

Ponytail includes lifecycle hooks. After first install or a material update:

1. open Codex;
2. open `/hooks`;
3. review and trust the hooks you want to allow;
4. start a new Codex thread so the global instructions are rebuilt.

FRY does not bypass this trust step.

## Update an existing machine

After FRY v0.3 is installed, simply ask Codex:

    Update FRY

The `fry-update` skill will sync from the GitHub source of truth.

You can also run the updater manually.

macOS / Linux:

    bash scripts/update-fry.sh

Windows PowerShell:

    powershell -ExecutionPolicy Bypass -File .\scripts\update-fry.ps1

## New projects

No FRY bootstrap is required for ordinary projects. The machine-global router is loaded automatically by Codex before the project instructions.

Use a project `AGENTS.md` only when the repository has domain-specific rules, constraints, required workflows, or exceptions.

The legacy bootstrap scripts remain available only as a convenience for creating the project-specific AGENTS.md template.

## Optional capabilities

Approved optional modules are not installed merely because they are listed in the pack. The global router may install an approved on-demand capability when the current task clearly needs it.

Pilot and tracked external tools are never auto-installed.

## Project-level Impeccable hook

The global Impeccable skill works without a project hook. If a specific UI project benefits from automatic detector feedback, run inside that project:

    npx impeccable@4.5.2 install --providers=codex --scope=project

Then review the project hook in `/hooks`.

See SOURCES.md and manifest.yaml for provenance, reviewed references, routing and install policy.
