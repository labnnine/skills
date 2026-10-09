#!/usr/bin/env bash
set -euo pipefail

say() { printf "\n==> %s\n" "$1"; }

need() {
  if ! command -v "$1" >/dev/null 2>&1; then
    echo "Missing required command: $1" >&2
    exit 1
  fi
}

need codex
need git
need npx

say "Installing / refreshing Ponytail"
codex plugin marketplace add DietrichGebert/ponytail
codex plugin add ponytail@ponytail

say "Installing / refreshing Anthropic frontend-design"
tmp="$(mktemp -d)"
cleanup() { rm -rf "$tmp"; }
trap cleanup EXIT

git clone --depth 1 --filter=blob:none --sparse https://github.com/anthropics/skills.git "$tmp/anthropic-skills" >/dev/null 2>&1
git -C "$tmp/anthropic-skills" sparse-checkout set skills/frontend-design

skills_root="$HOME/.agents/skills"
dest="$skills_root/frontend-design"
mkdir -p "$skills_root"

if [ -e "$dest" ]; then
  stamp="$(date +%Y%m%d-%H%M%S)"
  backup="$skills_root/frontend-design.backup-$stamp"
  mv "$dest" "$backup"
  echo "Backed up existing frontend-design to: $backup"
fi

cp -R "$tmp/anthropic-skills/skills/frontend-design" "$dest"
echo "Installed frontend-design to: $dest"

say "Installing / refreshing Impeccable globally for Codex"
npx --yes impeccable install --providers=codex --scope=global --no-hooks

say "Core install complete"
printf "%s\n"   "Next steps in Codex:"   "1. Open /hooks and review/trust Ponytail's two lifecycle hooks."   "2. Start a new thread."   "3. Open /skills and verify frontend-design and impeccable are available."   ""   "Optional per-project Impeccable hook:"   "npx impeccable install --providers=codex --scope=project"
