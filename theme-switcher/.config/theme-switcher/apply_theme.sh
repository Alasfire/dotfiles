#!/bin/bash

THEME="$1"
echo "[DEBUG] theme = $THEME"

# === Set active window border color ===

HCONF="$HOME/.config/hypr/hyprland.conf"
ACTIVE_BORDER_LINE="col.active_border"

# Define border colors per theme
case "$THEME" in
  black_hole)
    BORDER_COLOR="0xFF4F2747"
    ;;
  japanese)
    BORDER_COLOR="0xFF363022"
    ;;
  cyberpunk)
    BORDER_COLOR="0xFFFF035A"
    ;;
  *)
    BORDER_COLOR="0xffaaaaaa" # fallback
    ;;
esac

# Safely update col.active_border inside the general {} block
sed -i "/^\s*general\s*{/,/^\s*}/s/^\(\s*$ACTIVE_BORDER_LINE\s*=\s*\).*/\1$BORDER_COLOR/" "$HCONF"

# Reload Hyprland config
hyprctl reload


# Kill existing hyprpaper
pkill hyprpaper

# Launch hyprpaper with new config
hyprpaper -c "$HOME/.config/hyprpaper/$THEME/hyprpaper.conf" &

# Kill Waybar
killall waybar 2>/dev/null
sleep 0.3

echo "[DEBUG] theme = $THEME"

# Pick Waybar style based on theme
if [[ "$THEME" == "black_hole" ]]; then
  STYLE_PATH="$HOME/.config/waybar/black_hole.css"
elif [[ "$THEME" == "japanese" ]]; then
  STYLE_PATH="$HOME/.config/waybar/japanese.css"
elif [[ "$THEME" == "cyberpunk" ]]; then
  STYLE_PATH="$HOME/.config/waybar/cyberpunk.css"
else
  STYLE_PATH="$HOME/.config/waybar/blac_hole.css"
fi

# Launch Waybar with config and style explicitly passed
waybar --config "$HOME/.config/waybar/config" --style "$STYLE_PATH" &

# (Optional) Add reloads for waybar, alacritty etc here

echo "Theme '$THEME' applied."
