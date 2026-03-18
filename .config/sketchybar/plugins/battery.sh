#!/bin/sh

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep -o "AC Power")

if [ "$PERCENTAGE" -lt 20 ]; then
  if [ -n "$CHARGING" ]; then
    ICON="󰂆"
    sketchybar --set "$NAME" drawing=on icon="$ICON" label="${PERCENTAGE}%" background.color=0x12ffffff
  else
    ICON="󰁻"
    sketchybar --set "$NAME" drawing=on icon="$ICON" label="${PERCENTAGE}%" icon.color=0xccff3b30 label.color=0xccff3b30 background.color=0x12ffffff
  fi
else
  sketchybar --set "$NAME" drawing=off
fi
