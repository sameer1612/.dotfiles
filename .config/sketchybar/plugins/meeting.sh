# !/bin/sh

MEETING_LABEL="$(~/.config/sketchybar/plugins/meeting-label.py "$(mcal list)")"

if [ "$MEETING_LABEL" == "---" ]; then
  sketchybar --set $NAME label=""
  sketchybar --set $NAME background.drawing=off
else
  sketchybar --set $NAME background.drawing=on
  sketchybar --set $NAME label="${MEETING_LABEL}"
fi
