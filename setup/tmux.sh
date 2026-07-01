#!/usr/bin/env bash

set -euo pipefail

TPM_DIR="$HOME/.tmux/plugins/tpm"

if [[ ! -d "$TPM_DIR" ]]; then
    echo "==> Installing TPM"
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

echo "==> Installing tmux plugins"
"$TPM_DIR/bin/install_plugins"

echo "✓ tmux configured"
