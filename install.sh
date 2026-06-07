#!/bin/bash

set -e

for dir in */; do
  pkg="${dir%/}"

  if [[ "$pkg" == "system-tools" ]]; then
    continue
  fi

  echo "Stowing $pkg..."
  stow --adopt -t ~ "$pkg"
done

echo "Stowing system-tools..."
sudo stow --adopt -t / system-tools

echo "Done."
