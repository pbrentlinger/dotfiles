#!/bin/bash
# Usage: toggle_workspace.sh <workspace_number>

current=$(hyprctl activeworkspace -j | jq '.id')

target="$1"

if [[ "$current" == "$target" ]]; then
  hyprctl dispatch workspace previous
else
  hyprctl dispatch workspace "$target"
fi
