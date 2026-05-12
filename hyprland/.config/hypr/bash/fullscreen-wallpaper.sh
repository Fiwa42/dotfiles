#!/usr/bin/env bash
# File: ~/.config/hypr/bash/fullscreen-wallpaper.sh
# Requires: hyprctl, qs (Noctalia), jq

# Track last state to avoid repeated toggles
last_state="none"

while true; do
    # Check if any workspace has a fullscreen window
    fullscreen_count=$(hyprctl workspaces | grep -Eo 'hasfullscreen: [0-9]+' | awk '{s+=$2} END {print s}')

    if [[ "$fullscreen_count" -gt 0 ]]; then
        is_fullscreen=true
    else
        is_fullscreen=false
    fi

    # Only perform actions on state changes
    if [[ "$is_fullscreen" == true && "$last_state" != "fullscreen" ]]; then
        qs -c noctalia-shell ipc call wallpaper disableAutomation
        last_state="fullscreen"
    elif [[ "$is_fullscreen" == false && "$last_state" != "normal" ]]; then
        qs -c noctalia-shell ipc call wallpaper enableAutomation
        last_state="normal"
    fi

    sleep 10
done
