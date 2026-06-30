#!/bin/bash

set -e

for dir in */; do
    pkg="${dir%/}"

    if [[ "$pkg" == "system-tools" || "$pkg" == "scripts" || "$pkg" == "utils"]]; then
        continue
    fi

    echo "Stowing $pkg..."
    stow -t ~ "$pkg"
done

echo "Stowing system-tools..."
sudo stow -t / system-tools

# Symlink scripts into ~/.local/bin
echo "Stowing scripts..."
mkdir -p ~/.local/bin
stow -t ~/.local/ scripts


echo "Done."
