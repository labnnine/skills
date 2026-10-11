# FRY New Project Development Pack

> **最簡單使用方法：每部 Mac / Windows 只需安裝 FRY 一次。之後開任何新 Codex project，直接講你想整乜；Global Router 會自動揀相關 skills。**

## New machine — copy-paste once into Codex

```text
Install my machine-global FRY Development Environment from this source of truth:

https://github.com/labnnine/skills/tree/fry-new-project-development-pack/packs/fry-new-project-development-pack

This is NOT a project-local setup.

Read README.md, INSTALL.md, manifest.yaml, SOURCES.md and global/AGENTS.md.
Use the installer for this operating system to:
- install or refresh the approved Core stack;
- apply the FRY Global Router to my user-level Codex AGENTS.md while preserving unrelated existing global instructions;
- install the fry-update skill;
- record the installed FRY version.

Do not auto-install pilot or external tools.
Do not install optional modules unless they are already required by the current task.
Do not bypass manual trust, hook, credential, paid-service, or security prompts.

When finished, tell me only what manual action still remains, such as reviewing /hooks.
```

## Existing machine — update

In Codex, say:

```text
Update FRY
```

The installed `fry-update` skill will sync the machine-global environment from this GitHub pack.

## Everyday use

For a normal new project, **there is no FRY activation prompt**. Just describe the project.

Example:

```text
I want to build an internal tool that imports Excel files, classifies job levels, and shows a review dashboard.
```

Codex should read the machine-global FRY Router, inspect available skill metadata, and route only to relevant capabilities.

## Core

1. **Ponytail** — engineering restraint.
2. **Anthropic Frontend Design** — visual direction.
3. **Impeccable** — workflow/UX, information architecture, audit and polish.

## Approved on-demand capabilities

- **Brandkit** — brand identity.
- **Anthropic Canvas Design** — static artwork / key visuals.
- **Remotion Best Practices** — video and motion composition.
- **Scroll World** — immersive cinematic scroll-scrubbed landing pages.
- **Taste Skill** — specialist marketing/portfolio frontend alternative.
- **Agency Agents** — curated specialist personas; never install the whole roster by default.

## Pilot / tracked tools

- **Cognee** — pilot persistent-memory layer. Not auto-installed yet.
- **Voicebox** — tracked local voice I/O workstation tool.
- **OmniRoute** — tracked multi-model routing infrastructure.

## Architecture

```text
GitHub FRY Pack (source of truth)
        |
        +-- manifest.yaml
        +-- global/AGENTS.md
        +-- skills/fry-update/
        +-- scripts/
        |
        v
Machine
        |
        +-- ~/.codex/AGENTS.md       FRY Global Router block
        +-- ~/.codex/fry-pack.yaml   installed version/state
        +-- ~/.agents/skills/        user-wide skills
        +-- Codex plugins            e.g. Ponytail
        |
        v
All Codex projects on that machine
```

Project-specific `AGENTS.md` remains optional and is for domain/business rules that should override the generic global defaults.

See [INSTALL.md](./INSTALL.md) for installation/update details, [AGENTS.md](./AGENTS.md) for the full routing contract, and [SOURCES.md](./SOURCES.md) for upstream provenance.

## Status

**v0.3 — GitHub Source of Truth + Global Router + FRY Updater**
