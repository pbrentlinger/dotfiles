#!/usr/bin/env bash

selection=$(fuzzel --dmenu --log-level=none --prompt="Emoji > " < ~/.config/hypr/static/emoji-list.txt)

if [ -n "$selection" ]; then
    # Retreive the Emoji from the selection string
    emoji=$(printf "%s" "$selection" | cut -d ':' -f 1 | tr -d '\n')

    if command -v wl-copy $>/dev/null; then
        wl-copy $emoji
        notify-send "Emoji" "${emoji} Copied!"
        exit 0
    fi

    # If failed to copy, output Emoji to Stdout
    printf ${emoji}
fi

exit 0
