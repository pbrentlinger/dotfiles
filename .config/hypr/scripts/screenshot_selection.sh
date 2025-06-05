#!/bin/bash
# .config/hypr/scripts/screenshot_display.sh
# Screenshot the current display Shift+Print
grim -g "$(slurp)" - | swappy -f -
