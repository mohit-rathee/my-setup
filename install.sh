#!/bin/bash

set -e

# Symlink scripts into ~/.local/bin
mkdir -p ~/.local/bin
stow -t ~/.local/ scripts

for dir in */; do
    pkg="${dir%/}"

    if [[ "$pkg" == "system-tools" || "$pkg" == "scripts" ]]; then
        continue
    fi

    echo "Stowing $pkg..."
    stow -t ~ "$pkg"
done

echo "Stowing system-tools..."
sudo stow -t / system-tools

echo "Done."
