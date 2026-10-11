#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo "install-core.sh is retained for compatibility; delegating to install-fry.sh."
bash "$script_dir/install-fry.sh"
