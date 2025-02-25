#!/bin/bash

hyprctl binds -j | jq -r '.[] | select(.description != null and .description != "") | . as $bind | (if (.modmask|type) == "array" then .modmask else [.modmask] end | map(
    if . == 1 then "SHIFT"
    elif . == 2 then "CAPS"
    elif . == 4 then "CTRL"
    elif . == 5 then "CTRL+SHIFT"
    elif . == 8 then "ALT"
    elif . == 9 then "ALT+SHIFT"
    elif . == 12 then "ALT+CTRL"
    elif . == 13 then "ALT+CTRL+SHIFT"
    elif . == 64 then "WIN"
    elif . == 65 then "WIN+SHIFT"
    elif . == 68 then "WIN+CTRL"
    elif . == 69 then "WIN+CTRL+SHIFT"
    elif . == 72 then "WIN+ALT"
    elif . == 73 then "WIN+ALT+SHIFT"
    elif . == 76 then "WIN+ALT+CTRL"
    elif . == 77 then "WIN+ALT+CTRL+SHIFT"
    else "MOD\(.)" end
) | join("+"))+(if .modmask then "+" else "" end)+.key + " → " + .description' | wofi --dmenu -i -p "Hyprland Bindings" --matching=fuzzy --normal-window
