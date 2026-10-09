# FRY New Project Development Pack

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

**v0.1 — architecture skeleton**

This repository intentionally does not vendor third-party skill contents yet. It records upstream sources and routing so skills can be installed or updated from their original maintainers.
