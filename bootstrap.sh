#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="$SCRIPT_DIR/lib"

# get authentication token
source "$LIB_DIR/keep-alive.sh"

start_sudo_keepalive
trap stop_sudo_keepalive EXIT

# # set visible fonts
# sudo setfont ter-v32n

bash "$SCRIPT_DIR/packages/install.sh"

bash "$SCRIPT_DIR/dotfiles/install.sh"

for script in "$SCRIPT_DIR"/setup/*.sh; do
    echo
    echo "==> Running $(basename "$script")"
    bash "$script"
done

stop_sudo_keepalive

echo
echo "✓ Bootstrap complete."
