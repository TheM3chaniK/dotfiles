#!/usr/bin/env bash

DIR="$HOME/Pictures/wallpapers"
WOFI_STYLE="$HOME/.config/wofi/style/wallpaper.css"
WALLPAPER_LN="$HOME/.config/sway/wallpaper"

while true; do
  # Pick a file with wofi
  SELECTED=$(ls "$DIR" | wofi --dmenu --prompt "Pick wallpaper" --style "$WOFI_STYLE")

  [ -z "$SELECTED" ] && echo "No selection." && exit 1

  # Show in nsxiv
  imv "$DIR/$SELECTED"

  # After quit, ask with wofi
  CONFIRM=$(echo -e "Yes\nNo" | wofi --dmenu --prompt "Apply this wallpaper?" --style "$WOFI_STYLE")

  if [[ "$CONFIRM" == "Yes" ]]; then
    swww img "$DIR/$SELECTED"
    # Deleting the symlink of wallpaper which is set as current wallpaper in sway config
    rm $WALLPAPER_LN
    ln -s "$DIR/$SELECTED" "$WALLPAPER_LN"
    break
  fi

  # Else loop again
done

