#!/bin/bash

CHOICE=$(echo -e " [Shutdown]\n [Reboot]\n [Lock]\n [Logout]\n [Cancel]" | \
  wofi --dmenu --width 100% --height 100% --prompt " " --style ~/.config/wofi/style/power.css)

case "$CHOICE" in
  *\[Shutdown\]*)
    systemctl poweroff
    ;;
  *\[Reboot\]*)
    systemctl reboot
    ;;
  *\[Lock\]*)
    swaylock
    ;;
  *\[Logout\]*)
    swaymsg exit
    ;;
  *)
    ;;
esac


