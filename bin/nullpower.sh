#!/usr/bin/env bash
# nullpower.sh - Seamless power mode automation for Linux laptops (ThinkPad P1 Gen3 optimized)
#
# Dependencies: tlp, brightnessctl, (optional: docker, bluetooth)
# Logs to: ~/.local/share/nullpower/nullpower.log

set -euo pipefail

LOGDIR="$HOME/.local/share/nullpower"
LOGFILE="$LOGDIR/nullpower.log"
mkdir -p "$LOGDIR"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOGFILE"
}

get_power_state() {
    # Returns 'AC' or 'BAT'
    if [ -e /sys/class/power_supply/AC/online ]; then
        grep -q 1 /sys/class/power_supply/AC/online && echo "AC" || echo "BAT"
    else
        upower -i $(upower -e | grep AC) | grep -q 'online:.*yes' && echo "AC" || echo "BAT"
    fi
}

set_brightness() {
    if [ "$1" = "AC" ]; then
        brightnessctl set 100%
        log "Brightness set to 100% (AC)"
    else
        brightnessctl set 30%
        log "Brightness set to 30% (BAT)"
    fi
}

set_tlp_profile() {
    if [ "$1" = "AC" ]; then
        sudo tlp ac
        log "TLP set to AC mode"
    else
        sudo tlp bat
        log "TLP set to BAT mode"
    fi
}

manage_docker() {
    if command -v docker &>/dev/null; then
        if [ "$1" = "AC" ]; then
            sudo systemctl start docker && log "Docker started (AC)" || log "Failed to start Docker"
        else
            sudo systemctl stop docker && log "Docker stopped (BAT)" || log "Failed to stop Docker"
        fi
    fi
}

manage_bluetooth() {
    if command -v bluetoothctl &>/dev/null; then
        if [ "$1" = "AC" ]; then
            sudo systemctl start bluetooth && log "Bluetooth started (AC)" || log "Failed to start Bluetooth"
        else
            sudo systemctl stop bluetooth && log "Bluetooth stopped (BAT)" || log "Failed to stop Bluetooth"
        fi
    fi
}

main() {
    STATE=$(get_power_state)
    log "Detected power state: $STATE"
    set_brightness "$STATE"
    set_tlp_profile "$STATE"
    manage_docker "$STATE"
    manage_bluetooth "$STATE"
    log "Profile switch complete."
}

main "$@" 