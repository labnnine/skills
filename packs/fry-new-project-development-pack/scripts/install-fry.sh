#!/usr/bin/env bash
set -euo pipefail

say() { printf '\n==> %s\n' "$1"; }
need() { command -v "$1" >/dev/null 2>&1 || { echo "Missing required command: $1" >&2; exit 1; }; }

need codex
need git
need npx
need awk

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pack_dir="$(cd "$script_dir/.." && pwd)"
version="0.3.0"

say "Installing / refreshing Ponytail"
codex plugin marketplace add DietrichGebert/ponytail >/dev/null 2>&1 || true
codex plugin marketplace upgrade >/dev/null 2>&1 || true
codex plugin add ponytail@ponytail >/dev/null 2>&1 || true

say "Installing reviewed Anthropic frontend-design"
tmp="$(mktemp -d)"
cleanup() { rm -rf "$tmp"; }
trap cleanup EXIT
mkdir -p "$tmp/anthropic-skills"
git -C "$tmp/anthropic-skills" init -q
git -C "$tmp/anthropic-skills" remote add origin https://github.com/anthropics/skills.git
git -C "$tmp/anthropic-skills" fetch -q --depth 1 origin dbd4588f9e1033efb41dad4bef2f7947c8993d44
git -C "$tmp/anthropic-skills" checkout -q FETCH_HEAD -- skills/frontend-design

skills_root="$HOME/.agents/skills"
mkdir -p "$skills_root"
dest="$skills_root/frontend-design"
rm -rf "$dest"
cp -R "$tmp/anthropic-skills/skills/frontend-design" "$dest"

say "Installing Impeccable globally for Codex"
npx --yes impeccable@4.5.2 install --providers=codex --scope=global --no-hooks

say "Installing FRY update skill"
rm -rf "$skills_root/fry-update"
cp -R "$pack_dir/skills/fry-update" "$skills_root/fry-update"

say "Applying FRY Global Router"
codex_home="${CODEX_HOME:-$HOME/.codex}"
mkdir -p "$codex_home"
target="$codex_home/AGENTS.md"
router="$pack_dir/global/AGENTS.md"
start='<!-- FRY-GLOBAL-START -->'
end='<!-- FRY-GLOBAL-END -->'
cleaned="$(mktemp)"

if [ -f "$target" ]; then
  awk -v s="$start" -v e="$end" '
    index($0,s){skip=1; next}
    index($0,e){skip=0; next}
    !skip{print}
  ' "$target" > "$cleaned"
else
  : > "$cleaned"
fi

{
  cat "$cleaned"
  printf '\n%s\n' "$start"
  cat "$router"
  printf '\n%s\n' "$end"
} > "$target"

rm -f "$cleaned"

cat > "$codex_home/fry-pack.yaml" <<EOF
name: fry-new-project-development-pack
version: $version
source: https://github.com/labnnine/skills
branch: fry-new-project-development-pack
pack_path: packs/fry-new-project-development-pack
EOF

say "FRY $version installed"
printf '%s\n' \
  "Start a new Codex thread so the refreshed global AGENTS.md is loaded." \
  "Open /hooks and review/trust Ponytail hooks if Codex asks." \
  "New projects can now start directly from the task description."
