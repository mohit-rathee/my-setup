#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"

SOURCE_DIR="$REPO_ROOT/wallpapers"
TARGET_DIR="$HOME/wallpapers"

echo
echo "==> Installing wallpapers"

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Wallpaper directory not found: $SOURCE_DIR"
    exit 1
fi

mkdir -p "$TARGET_DIR"

cp -a "$SOURCE_DIR"/. "$TARGET_DIR"/

echo "✓ Wallpapers copied to $TARGET_DIR"

# for all images
# git clone https://github.com/w3dg/wallpapers ~
