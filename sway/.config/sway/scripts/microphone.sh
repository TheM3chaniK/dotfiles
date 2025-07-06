#!/bin/bash

IS_MUTED=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -c "yes")

if [ "$1" == "toggle" ]; then
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
fi

if [ "$IS_MUTED" -eq 1 ]; then
  echo '{"text": "", "class": "muted"}'
else
  echo '{"text": "", "class": "unmuted"}'
fi

