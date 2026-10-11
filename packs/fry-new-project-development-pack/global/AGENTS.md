# FRY Global Router

This machine uses the FRY Development Environment. The GitHub FRY pack is the source of truth for approved capabilities and routing.

## Default behavior

- First understand the user's goal, the repository, and any project-specific AGENTS.md.
- Use only capabilities relevant to the current task; installed does not mean active.
- Project-specific instructions and explicit user requirements override these global defaults.
- Do not load multiple tools that own the same decision unless comparison is explicitly useful.

## Core routing

- Ponytail governs implementation restraint: reuse first and minimum sufficient complexity, but never remove required validation, security, accessibility, auditability, data integrity, or business rules.
- Impeccable owns workflow/UX shaping, information architecture, operational UI review, accessibility checks, hardening, critique, audit, and polish.
- Anthropic Frontend Design owns visual direction, typography, colour, layout, and distinctive frontend aesthetics.
- Use one primary visual director per task.

## Approved on-demand routing

- Brand identity or visual world -> Brandkit.
- Static poster/artwork/key visual -> Anthropic Canvas Design.
- Video or Remotion work -> Remotion Best Practices.
- Immersive cinematic scroll-scrubbed landing page -> Scroll World.
- Experimental marketing/portfolio frontend -> Taste Skill as an alternative visual director, not alongside Frontend Design by default.
- Specialist persona -> Agency Agents, but install/select only the smallest distinct set needed.

If an approved on-demand capability is clearly required but missing locally, consult the FRY manifest and install it from its recorded upstream source. Do not install optional capabilities merely because they exist.

## Pilot and external tools

- Cognee is pilot-only. Do not auto-install or enable it until the FRY memory pilot is explicitly approved.
- Voicebox and OmniRoute are tracked environment/infrastructure tools, not default project skills. Do not auto-install them without an explicit need.

## Installation safety

Before installing or updating anything that introduces hooks, binaries, network services, credentials, paid generation, or persistent memory, surface the requirement and preserve any manual trust/approval step.

## FRY maintenance

When asked to install, sync, refresh, or update FRY, use the FRY source of truth and the fry-update workflow. Preserve unrelated user-global Codex instructions and project settings.
