#!/bin/bash

CONFIG_PATH="$HOME/.config/hypr/hyprpaper.conf"
NAME=""
WALLPAPER=""

echo "Initial = $NAME, $WALLPAPER" 


# Generate wallpapers dynamically via hyprpaper IPC
hyprctl monitors -j | jq -c '.[]' | while read -r MON; do

    echo "wallpaper = $NAME, $WALLPAPER" 

    NAME=$(echo "$MON" | jq -r '.name')

    echo "Name Init = $NAME, $WALLPAPER" 

    ORIENTATION=$(echo "$MON" | jq -r '.transform')
    case "$NAME" in
        "DP-1")
            if [[ "$ORIENTATION" == "0" || "$ORIENTATION" == "2" ]]; then
                WALLPAPER="$HOME/.config/hypr/static/mind_of_christ_4k.jpg"
                echo "Wallpaper Landscape = $NAME, $WALLPAPER" 
            else
                WALLPAPER="$HOME/.config/hypr/static/mind_of_christ_max_vert.jpg"
                echo "Wallpaper portrait = $NAME, $WALLPAPER" 
            fi
            ;;
        "HDMI-A-1")
            if [[ "$ORIENTATION" == "0" || "$ORIENTATION" == "2" ]]; then
                WALLPAPER="$HOME/.config/hypr/static/1080p/mind_of_christ_1080p.jpg"
                echo "Wallpaper Landscape = $NAME, $WALLPAPER" 
            else
                WALLPAPER="$HOME/.config/hypr/static/1080p/mind_of_christ_vert_1080p.jpg"
                echo "Wallpaper portrait = $NAME, $WALLPAPER" 
            fi
            ;;
        *)
            WALLPAPER="$HOME/.config/hypr/static/mind_of_christ_max.jpg"
            ;;
    esac
    # echo "preload = $WALLPAPER" >> "$CONFIG_PATH"

    # Set wallpaper via hyprpaper IPC
    hyprctl hyprpaper wallpaper "${NAME}, ${WALLPAPER}, cover"
done

echo "wallpaper = $NAME, $WALLPAPER" 

