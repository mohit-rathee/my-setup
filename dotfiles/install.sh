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
echo "==> Stowing system files"


# remove vconsole.conf
if [[ -e /etc/vconsole.conf && ! -L /etc/vconsole.conf ]]; then
    sudo mv /etc/vconsole.conf /etc/vconsole.conf.bak
fi

sudo stow --dir="$CONFIG_DIR" --target=/ system-tools

echo
echo "✓ Dotfiles successfully stowed."
