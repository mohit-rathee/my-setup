#!/usr/bin/env bash

set -euo pipefail

# get authentication token
sudo -v

# set visible fonts
sudo setfont ter-v32n

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
