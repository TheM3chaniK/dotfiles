#!/usr/bin/env bash

# Make the multi-timezone string
WORLD_TIME=$(cat <<EOF
🇮🇳 India (Kolkata): $(TZ='Asia/Kolkata' date '+%H%M %Z')
🇺🇸 USA (New York): $(TZ='America/New_York' date '+%H%M %Z')
🇺🇸 USA (California): $(TZ='America/Los_Angeles' date '+%H%M %Z')
🇬🇧 UK (London): $(TZ='Europe/London' date '+%H%M %Z')
🇨🇳 China (Beijing): $(TZ='Asia/Shanghai' date '+%H%M %Z')
🇯🇵 Japan (Tokyo): $(TZ='Asia/Tokyo' date '+%H%M %Z')
🇷🇺 Russia (Moscow): $(TZ='Europe/Moscow' date '+%H%M %Z')
🇧🇷 Brazil (Sao Paulo): $(TZ='America/Sao_Paulo' date '+%H%M %Z')
🇩🇪 Germany (Berlin): $(TZ='Europe/Berlin' date '+%H%M %Z')
🇦🇺 Australia (Sydney): $(TZ='Australia/Sydney' date '+%H%M %Z')
EOF
)

# Show in wofi with your custom style
echo "$WORLD_TIME" | wofi --dmenu --prompt "World Clock" --style ~/.config/wofi/launcher.css

