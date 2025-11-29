#!/bin/bash

CHOICE=$(echo -e " [Shutdown]\n [Reboot]\n [Lock]\n [Logout]\n [Cancel]" | \
  wofi --dmenu --prompt " " --style ~/.config/wofi/style/power.css)

case "$CHOICE" in
  *\[Shutdown\]*)
    systemctl poweroff
    ;;
  *\[Reboot\]*)
    systemctl reboot
    ;;
  *\[Lock\]*)
    $HOME/.config/sway/scripts/lock.sh
    ;;
  *\[Logout\]*)
    swaymsg exit
    ;;
  *)
    ;;
esac


