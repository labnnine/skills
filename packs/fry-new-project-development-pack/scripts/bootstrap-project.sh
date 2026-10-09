#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pack_dir="$(cd "$script_dir/.." && pwd)"
template="$pack_dir/templates/PROJECT_AGENTS.md"
project="${1:-$PWD}"

if [ ! -d "$project" ]; then
  echo "Project directory does not exist: $project" >&2
  exit 1
fi

target="$project/AGENTS.md"

if [ -e "$target" ]; then
  echo "AGENTS.md already exists. Left unchanged: $target"
else
  cp "$template" "$target"
  echo "Created: $target"
fi

marker="$project/.fry-development-pack.yaml"

if [ -e "$marker" ]; then
  echo "Pack marker already exists. Left unchanged: $marker"
else
  printf "%s\n"     "pack: fry-new-project-development-pack"     "version: 0.2.0"     "routing:"     "  engineering_restraint: ponytail"     "  visual_direction: anthropic-frontend-design"     "  ux_workflow_quality: impeccable"     "optional_modules: []" > "$marker"
  echo "Created: $marker"
fi

printf "%s\n"   ""   "Project bootstrap complete."   "Fill in AGENTS.md with this project's product truth and business rules."   "Optional Impeccable project hook:"   "npx impeccable install --providers=codex --scope=project"
