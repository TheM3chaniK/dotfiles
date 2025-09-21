#!/bin/bash

ID="1267:12736:ASUE120B:00_04F3:31C0_Touchpad"
STATE_FILE="/tmp/touchpad_state"

# Default state: enabled
if [ ! -f "$STATE_FILE" ]; then
    echo "enabled" > "$STATE_FILE"
fi

CURRENT=$(cat "$STATE_FILE")

if [ "$CURRENT" = "enabled" ]; then
    swaymsg input "$ID" events disabled
    echo "disabled" > "$STATE_FILE"
else
    swaymsg input "$ID" events enabled
    echo "enabled" > "$STATE_FILE"
fi

