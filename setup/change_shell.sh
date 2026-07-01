#!/usr/bin/env bash

set -euo pipefail

ZSH_PATH="$(command -v zsh)"

if [[ -z "$ZSH_PATH" ]]; then
    echo "Error: zsh is not installed."
    exit 1
fi

if [[ "$SHELL" != "$ZSH_PATH" ]]; then
    echo "Changing default shell to zsh..."
    sudo chsh -s "$ZSH_PATH" "$USER"

    echo "Default shell changed. Log out and back in for it to take effect."
else
    echo "zsh is already the default shell."
fi
