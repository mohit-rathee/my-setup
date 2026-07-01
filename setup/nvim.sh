#!/usr/bin/env bash

set -euo pipefail

echo "==> Synchronizing Neovim plugins..."

nvim --headless "+Lazy! sync" +qa

echo "✓ Neovim configured."
