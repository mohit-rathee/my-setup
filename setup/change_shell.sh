#!/usr/bin/env bash

set -euo pipefail

ZSH_PATH="$(command -v zsh)"

if [[ -z "$ZSH_PATH" ]]; then
    echo "Error: zsh is not installed."
    exit 1
fi
