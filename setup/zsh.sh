#!/usr/bin/env bash

set -euo pipefail

ZSH_PATH="$(command -v zsh)"

if [[ -z "$ZSH_PATH" ]]; then
    echo "Error: zsh is not installed."
    exit 1
fi

if [[ "$SHELL" != "$ZSH_PATH" ]]; then
    echo "==> Changing default shell to zsh"
    chsh -s "$ZSH_PATH"
    echo "✓ Default shell changed. Log out and log back in for the change to take effect."
else
    echo "✓ zsh is already the default shell."
fi
