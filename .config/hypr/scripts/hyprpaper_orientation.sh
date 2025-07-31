#!/bin/bash

CONFIG_PATH="$HOME/.config/hypr/hyprpaper.conf"

# Generate config
> "$CONFIG_PATH"
hyprctl monitors -j | jq -c '.[]' | while read -r MON; do
    NAME=$(echo "$MON" | jq -r '.name')
    ORIENTATION=$(echo "$MON" | jq -r '.transform')
    WALLPAPER=""
    case "$NAME" in
        "DP-1")
            if [[ "$ORIENTATION" == "0" || "$ORIENTATION" == "2" ]]; then
                WALLPAPER="$HOME/.config/hypr/static/mind_of_christ_4k.jpg"
            else
                WALLPAPER="$HOME/.config/hypr/static/mind_of_christ_max_vert.jpg"
            fi
            ;;
        "HDMI-A-1")
            if [[ "$ORIENTATION" == "0" || "$ORIENTATION" == "2" ]]; then
                WALLPAPER="$HOME/.config/hypr/static/1080p/mind_of_christ_1080p.jpg"
            else
                WALLPAPER="$HOME/.config/hypr/static/1080p/mind_of_christ_vert_1080p.jpg"
            fi
            ;;
        *)
            WALLPAPER="$HOME/.config/hypr/static/mind_of_christ_max.jpg"
            ;;
    esac
    echo "preload = $WALLPAPER" >> "$CONFIG_PATH"
    echo "wallpaper = $NAME, $WALLPAPER" >> "$CONFIG_PATH"
done

# Kill all running hyprpaper processes
pkill -x hyprpaper

# Wait a moment to ensure process is dead
sleep 0.5

# Restart hyprpaper with the new config
hyprpaper -c "$CONFIG_PATH" &
