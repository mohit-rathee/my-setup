#!/usr/bin/env bash

set -euo pipefail

echo "==> Enabling battery-conservation mode "

sudo systemctl daemon-reload
sudo systemctl enable --now battery-conservation.service

echo "✓ battery-conservation mode enabled."
