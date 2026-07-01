#!/usr/bin/env bash

start_sudo_keepalive() {
    sudo -v || return 1

    (
        while true; do
            sudo -n true
            sleep 6
        done
    ) >/dev/null 2>&1 &

    SUDO_KEEPALIVE_PID=$!
    export SUDO_KEEPALIVE_PID
}

stop_sudo_keepalive() {
    [[ -n "${SUDO_KEEPALIVE_PID:-}" ]] || return 0

    kill "$SUDO_KEEPALIVE_PID" 2>/dev/null || true
    wait "$SUDO_KEEPALIVE_PID" 2>/dev/null || true

    sudo -k
}
