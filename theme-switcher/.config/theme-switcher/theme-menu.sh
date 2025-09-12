#!/bin/bash

# Display names for user, mapped to actual folder names
declare -A THEME_MAP=(
    ["Black Hole"]="black_hole"
    ["Cyberpunk"]="cyberpunk"
    ["Japanese"]="japanese"
)

# Show display names in wofi menu
CHOICE=$(printf "%s\n" "${!THEME_MAP[@]}" | wofi --dmenu --prompt "Select Theme" --style ~/.config/wofi/themes/default.css)

# If user made a valid choice
if [ -n "$CHOICE" ]; then
    THEME_NAME="${THEME_MAP[$CHOICE]}"

    # Copy matching Wofi style
    cp ~/.config/wofi/themes/"$THEME_NAME".css ~/.config/wofi/themes/default.css

    # Apply the theme (wallpaper etc.)
    ~/.config/theme-switcher/apply_theme.sh "$THEME_NAME"
fi
