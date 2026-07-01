#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$SCRIPT_DIR/configs"

readonly SKIP_PACKAGES=(
    scripts
    system-tools
)

should_skip() {
    local pkg="$1"

    local skip
    for skip in "${SKIP_PACKAGES[@]}"; do
        [[ "$pkg" == "$skip" ]] && return 0
    done

    return 1
}

[[ -d "$CONFIG_DIR" ]] || {
    echo "Error: '$CONFIG_DIR' does not exist."
    exit 1
}

command -v stow >/dev/null 2>&1 || {
    echo "Error: GNU Stow is not installed."
    exit 1
}

echo "==> Stowing user dotfiles"

for dir in "$CONFIG_DIR"/*/; do
    pkg="${dir%/}"
    pkg="${pkg##*/}"

    should_skip "$pkg" && continue

    echo "  • $pkg"
    stow --dir="$CONFIG_DIR" --target="$HOME" "$pkg"
done

echo
echo "==> Stowing scripts"

mkdir -p "$HOME/.local/bin"
stow --dir="$CONFIG_DIR" --target="$HOME/.local" scripts

echo
echo "==> Installing system files"

SYSTEM_TOOLS_DIR="$CONFIG_DIR/system-tools"

sudo stow -D --dir="$CONFIG_DIR" --target=/ system-tools 2>/dev/null || true

find "$SYSTEM_TOOLS_DIR" -type f | while read -r src; do
    rel="${src#$SYSTEM_TOOLS_DIR/}"
    target="/$rel"

    if [[ -f "$target" && ! -L "$target" ]]; then
        echo "Conflict: $target"
        echo "Removing regular file so it can be managed by stow..."
        sudo rm -f "$target"
    fi
done

sudo stow --dir="$CONFIG_DIR" --target=/ system-tools

echo
echo "✓ System files successfully stowed."

echo
echo "✓ Dotfiles successfully stowed."
