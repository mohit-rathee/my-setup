#!/usr/bin/env bash

set -euo pipefail

if [[ ! -d ~/.oh-my-zsh ]]; then
    RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
