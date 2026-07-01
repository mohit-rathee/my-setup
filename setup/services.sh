#!/usr/bin/env bash

set -euo pipefail

SYSTEM_SERVICES=(
    NetworkManager
    bluetooth
)

USER_SERVICES=(
    pipewire.socket
    wireplumber.service
)

echo "==> Enabling system services"

for service in "${SYSTEM_SERVICES[@]}"; do
    echo "  • $service"
    sudo systemctl enable --now "$service"
done

echo
echo "==> Enabling user services"

for service in "${USER_SERVICES[@]}"; do
    echo "  • $service"
    systemctl --user enable --now "$service"
done

echo
echo "✓ Services configured."
