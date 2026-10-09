# Upstream Sources

The FRY pack currently records upstream projects instead of copying their full contents. This keeps provenance clear and makes future updates easier to audit.

## Core

### Ponytail
- Upstream: https://github.com/DietrichGebert/ponytail
- Role in FRY pack: engineering restraint / anti-overengineering
- Packaging note: plugin-style capability; treat installation and hooks separately from ordinary SKILL.md files.

### Anthropic Frontend Design
- Upstream: https://github.com/anthropics/skills/tree/main/skills/frontend-design
- Role in FRY pack: primary frontend visual-direction skill
- Packaging note: instruction-oriented Agent Skill.

### Impeccable
- Upstream: https://github.com/pbakaus/impeccable
- Role in FRY pack: UX/workflow shaping plus critique, audit, hardening, and polish
- Packaging note: broader design harness with skill content, references, scripts, commands, and optional hooks. Do not reduce it to a copied SKILL.md without reviewing its runtime requirements.

## Optional

### Brandkit
- Upstream: https://github.com/Leonxlnx/taste-skill/tree/main/skills/brandkit
- Role: brand identity / visual-world work.

### Anthropic Canvas Design
- Upstream: https://github.com/anthropics/skills/tree/main/skills/canvas-design
- Role: static artwork, posters, key visuals, and design-led PNG/PDF output.

### Remotion Best Practices
- Upstream: https://github.com/remotion-dev/skills/tree/main/skills/remotion-best-practices
- Role: Remotion video and motion-composition workflows.
- Note: this is a router with supporting references/sub-skills; preserve the upstream directory structure when installing.

## Specialist

### Taste Skill
- Upstream: https://github.com/Leonxlnx/taste-skill
- Role: landing pages, portfolios, redesigns, and more experimental marketing-oriented frontend work.
- FRY rule: do not pair with Anthropic Frontend Design by default because both try to own visual direction.

## Update policy

Before changing a pinned or installed module:

1. Read the upstream changelog / current SKILL.md / installer behavior.
2. Check for new scripts, binaries, hooks, network behavior, or provider-specific requirements.
3. Re-evaluate overlap with other FRY modules.
4. Update the manifest and routing contract if the module's role has changed.
5. Prefer upstream installation over vendoring unless there is a clear reason to pin a reviewed copy.
