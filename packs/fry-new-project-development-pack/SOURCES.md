# Upstream Sources

The FRY pack records upstream projects instead of copying their full contents unless FRY itself owns the file. This keeps provenance clear and makes updates auditable.

## Core

### Ponytail
- Upstream: https://github.com/DietrichGebert/ponytail
- Role: engineering restraint / anti-overengineering.
- Packaging: Codex plugin with lifecycle hooks.

### Anthropic Frontend Design
- Upstream: https://github.com/anthropics/skills/tree/main/skills/frontend-design
- Role: primary frontend visual-direction skill.
- Packaging: instruction-oriented Agent Skill.

### Impeccable
- Upstream: https://github.com/pbakaus/impeccable
- Role: UX/workflow shaping, information architecture, critique, audit, hardening, and polish.
- Packaging: broader design harness with skill content, references, scripts, commands, and optional hooks.

## Approved optional capabilities

### Brandkit
- Upstream: https://github.com/Leonxlnx/taste-skill/tree/main/skills/brandkit
- Role: brand identity / visual-world work.
- Install only when the project genuinely needs branding.

### Anthropic Canvas Design
- Upstream: https://github.com/anthropics/skills/tree/main/skills/canvas-design
- Role: static artwork, posters, key visuals, and design-led PNG/PDF output.

### Remotion Best Practices
- Upstream: https://github.com/remotion-dev/skills/tree/main/skills/remotion-best-practices
- Role: Remotion video and motion-composition workflows.
- Preserve the upstream router/reference directory structure.

### Scroll World
- Upstream: https://github.com/oso95/scroll-world
- Role: immersive scroll-scrubbed cinematic landing pages.
- Codex install: `npx skills add oso95/scroll-world -a codex`.
- Full media pipeline can require Monid/Higgsfield, ffmpeg, Python/Pillow, and paid generation.
- Never install or activate for ordinary frontend work.

## Specialist capabilities

### Taste Skill
- Upstream: https://github.com/Leonxlnx/taste-skill
- Role: landing pages, portfolios, redesigns, and experimental marketing-oriented frontend work.
- FRY rule: do not pair with Anthropic Frontend Design by default because both try to own visual direction.

### Agency Agents
- Upstream: https://github.com/msitarzewski/agency-agents
- Role: specialist agent personas.
- Codex supports targeted installation through the project's installer.
- FRY rule: never install the full roster by default. Select only distinct specialists needed by the current project.

## Pilot

### Cognee
- Upstream: https://github.com/topoteretes/cognee
- Integrations: https://github.com/topoteretes/cognee-integrations
- Role: persistent cross-session agent memory and knowledge graph.
- Codex integration uses a plugin and hooks.
- FRY status: pilot only. Do not auto-install until capture, stale-memory, privacy, deletion, and hook behavior are validated.

## Tracked external tools

### Voicebox
- Upstream: https://github.com/jamiepine/voicebox
- Role: local TTS, STT, dictation, voice cloning, REST API, and MCP voice I/O.
- FRY status: workstation integration, not a project skill. Do not auto-install.

### OmniRoute
- Upstream: https://github.com/diegosouzapw/OmniRoute
- Role: multi-provider/model gateway, routing, quota fallback, and token-cost control.
- FRY status: infrastructure option, not a default development skill. Do not auto-install unless multi-model routing is an explicit need.

## Update policy

Before changing a pinned, installed, or approved module:

1. Read the current upstream changelog, SKILL.md, installer behavior, and release notes.
2. Check for new scripts, binaries, hooks, network behavior, costs, credentials, or provider-specific requirements.
3. Re-evaluate overlap with other FRY modules.
4. Record a reviewed commit/ref when practical.
5. Update the manifest and routing contract if the module's role has changed.
6. Prefer upstream installation over vendoring unless there is a clear reason to pin a reviewed copy.
7. Do not silently promote a pilot or tracked external tool into Core.
