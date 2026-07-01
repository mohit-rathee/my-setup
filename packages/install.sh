#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
LIB_DIR="$ROOT_DIR/lib"
PACKAGE_FILE="$ROOT_DIR/packages.conf"

source "$LIB_DIR/ui.sh"
source "$LIB_DIR/parser.sh"
source "$LIB_DIR/selector.sh"
source "$LIB_DIR/package_manager.sh"
source "$LIB_DIR/install_yay.sh"

main() {

    sudo -v

    header "Preparing Installation"

    info "Loading package configuration..."

    parse_packages "$PACKAGE_FILE"

    tick "Configuration loaded"

    select_optional_groups

    echo

    info "Updating package database..."

    if sudo pacman -Syu --needed --noconfirm; then
        tick "System updated"
    else
        cross "System update failed"
        exit 1
    fi

    echo

    install_packages pacman

    echo

    if command -v yay >/dev/null 2>&1; then
        tick "yay already installed"
    else
        install_yay
    fi

    echo

    install_packages yay

    echo

    success "Environment successfully installed."
}

main "$@"
