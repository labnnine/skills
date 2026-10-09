# FRY New Project Development Pack — Routing Contract

These instructions define how to route work across the FRY development stack. They do not override explicit user requirements or a project's own domain rules.

## Precedence

Use this order when instructions conflict:

1. Explicit user request and acceptance criteria.
2. Project-specific business rules, constraints, and project AGENTS.md.
3. This FRY pack routing contract.
4. Individual skill defaults.

The brief wins over a skill's preferred aesthetic or implementation pattern.

## Core roles

### Ponytail — engineering governor

Use Ponytail as the default implementation restraint layer.

Its job is to reduce unnecessary code, dependencies, abstraction, and architecture while preserving correctness, maintainability, accessibility, and explicit project requirements.

Ponytail must not erase complexity that is genuinely required by business rules, auditability, security, accessibility, data integrity, or long-term maintainability.

### Anthropic Frontend Design — visual direction

Use for new UI or major visual redesign work where the interface needs deliberate visual direction.

Primary ownership:
- visual hierarchy
- typography
- colour and palette
- layout composition
- visual personality
- anti-template / anti-generic design decisions
- restrained motion direction
- frontend microcopy consistency where relevant

Do not use it as the primary owner of business workflow or complex information architecture.

### Impeccable — UX, workflow, and quality system

Use Impeccable when the work needs:
- workflow shaping
- information architecture
- multi-step product UI
- dashboard or operational UI thinking
- critique and heuristic review
- accessibility or responsive audit
- error, empty, loading, and edge states
- hardening and production polish

For ambiguous new product flows, prefer **shape** before visual implementation.

For completed or near-completed UI, prefer bounded review passes such as **critique**, **audit**, and **polish** rather than endless redesign loops.

## Standard new-project sequence

When building a new product surface:

1. Establish product truth:
   - audience
   - primary job-to-be-done
   - business rules
   - constraints
   - data and system boundaries

2. If workflow or IA is unclear:
   - route to Impeccable shape.

3. If visual direction is unclear:
   - route to Anthropic Frontend Design.

4. Build:
   - respect the chosen UX and visual direction.
   - apply Ponytail restraint to implementation decisions.

5. Verify:
   - use Impeccable critique for UX/design review when useful.
   - use audit for technical UI quality.
   - use polish for the final bounded cleanup pass.

## Optional module routing

### Brandkit

Use only when the task includes brand identity, logo direction, visual-world creation, or brand-system presentation.

Do not invoke for ordinary internal tools just because the product lacks a logo.

### Anthropic Canvas Design

Use only for static visual artifacts such as posters, artwork, key visuals, covers, concept boards, or visual presentation pieces.

Do not use for operational product UI.

### Remotion Best Practices

Use only when the deliverable involves video, motion composition, Remotion implementation, captions, rendering, multimedia, or related video workflows.

### Taste Skill

Treat as a specialist alternative for landing pages, portfolios, marketing pages, or intentionally experimental presentation-oriented frontend work.

Do **not** load Taste Skill and Anthropic Frontend Design together by default. Pick one primary visual director unless the user explicitly asks to compare or combine approaches.

## Anti-conflict rules

- One primary visual director per task.
- One primary workflow/UX owner per task.
- Do not add optional modules merely because they are installed.
- Do not let aesthetic rules override accessibility, product truth, or explicit user constraints.
- Do not let Ponytail simplify away required audit trails, validation, permissions, or domain rules.
- Do not run unbounded self-review loops.

## Missing tools

If a routed skill or plugin is not installed in the current Codex environment, do not silently substitute a different tool. State which capability is missing and continue with the closest safe workflow only when the task can still be completed reliably.
