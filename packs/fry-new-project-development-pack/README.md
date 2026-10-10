# FRY New Project Development Pack

> **最簡單使用方法：每次開新 Codex project，只要先跑一次 FRY bootstrap，之後直接同 Codex 講你想整乜；唔使逐個 skill 開關。**

### Copy-paste prompt for Codex

If you do not remember the setup steps, paste this into Codex from the new project's root:

```text
Set up this project with my FRY New Project Development Pack.

Source:
https://github.com/labnnine/skills/tree/fry-new-project-development-pack/packs/fry-new-project-development-pack

Do the following:
1. Read the pack's README.md, INSTALL.md, AGENTS.md, manifest.yaml and SOURCES.md.
2. Check whether the Core stack is already available on this machine:
   - Ponytail
   - Anthropic frontend-design
   - Impeccable
3. If any Core component is missing, install it using the pack's documented installer for this operating system.
4. Bootstrap the current project using the pack's project bootstrap script.
5. Do not overwrite an existing AGENTS.md. Preserve existing project rules and integrate the FRY routing rules safely.
6. Do not enable optional modules unless the current project actually needs them.
7. Confirm when the project is ready, and tell me only if a manual trust step such as /hooks is still required.

After setup, use FRY routing automatically. I should only need to describe what I want to build; do not ask me to manually toggle individual skills unless there is a real conflict.
```

A reusable Codex development stack for starting and improving new software projects without loading every design or engineering instruction at once.

## Core idea

This pack is a router, not a prompt dump. Each tool keeps a distinct job:

1. **Ponytail** — engineering restraint: prefer the simplest sufficient implementation, reuse existing capabilities, avoid unnecessary abstraction.
2. **Anthropic Frontend Design** — visual direction: intentional layout, typography, colour, hierarchy, and anti-template frontend design.
3. **Impeccable** — product UX and design QA: workflow shaping, information architecture, critique, audit, accessibility, hardening, and polish.

The core tools are complementary, but should not all take ownership of the same decision.

## Optional modules

- **Brandkit** — brand identity and visual-world exploration.
- **Anthropic Canvas Design** — posters, static artwork, key visuals, and other non-UI visual artifacts.
- **Remotion Best Practices** — video and motion-composition work.
- **Taste Skill** — specialist option for landing pages, portfolios, and experimental marketing sites. It is not a default companion to Anthropic Frontend Design.

## Default routing

For a new product or internal tool:

1. Clarify product truth and constraints.
2. Use **Impeccable / shape** when workflow, information architecture, user flow, or product UX is unclear.
3. Use **Anthropic Frontend Design** when visual direction or frontend aesthetic needs to be established.
4. Keep **Ponytail** as the implementation restraint layer.
5. After implementation, use **Impeccable critique → audit → polish** as appropriate.
6. Invoke optional modules only when the deliverable actually needs them.

See [AGENTS.md](./AGENTS.md) for the routing contract and [SOURCES.md](./SOURCES.md) for upstream projects.

## Status

**v0.2 — installer layer**

This repository intentionally does not vendor third-party skill contents yet. It records upstream sources and routing, and now includes cross-platform installers for the Core stack plus per-project bootstrap scripts.
