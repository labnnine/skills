#!/usr/bin/env bash
set -euo pipefail

command -v git >/dev/null 2>&1 || { echo "Missing required command: git" >&2; exit 1; }

tmp="$(mktemp -d)"
cleanup() { rm -rf "$tmp"; }
trap cleanup EXIT

git clone -q --depth 1 --branch fry-new-project-development-pack --filter=blob:none --sparse https://github.com/labnnine/skills.git "$tmp/skills"
git -C "$tmp/skills" sparse-checkout set packs/fry-new-project-development-pack
bash "$tmp/skills/packs/fry-new-project-development-pack/scripts/install-fry.sh"
