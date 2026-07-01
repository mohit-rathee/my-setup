#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

bash "$SCRIPT_DIR/packages/install.sh"

bash "$SCRIPT_DIR/dotfiles/install.sh"

for script in "$SCRIPT_DIR"/setup/*.sh; do
    echo
    echo "==> Running $(basename "$script")"
    bash "$script"
done

echo
echo "✓ Bootstrap complete."
