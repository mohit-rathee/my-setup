#!/usr/bin/env bash

# Use a global variable instead of export
SUDO_KEEPALIVE_PID=""

start_sudo_keepalive() {
    # Check/refresh sudo access
    sudo -v || return 1

    # Loop silently in background
    (
        while true; do
            sudo -n true
            sleep 6
        done
    ) >/dev/null 2>&1 &

    # Save background PID globally
    SUDO_KEEPALIVE_PID=$!
}

stop_sudo_keepalive() {
    # Exit if no loop runs
    [[ -n "${SUDO_KEEPALIVE_PID}" ]] || return 0

    # Kill background process
    kill "$SUDO_KEEPALIVE_PID" 2>/dev/null || true
    wait "$SUDO_KEEPALIVE_PID" 2>/dev/null || true

    # Clear active sudo tokens
    sudo -k
    SUDO_KEEPALIVE_PID=""
}

