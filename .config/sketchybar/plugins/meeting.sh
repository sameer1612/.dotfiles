# !/bin/sh

MEETING_LABEL="$(~/.config/sketchybar/plugins/meeting-label.py "$(mcal list)")"

if [ "$MEETING_LABEL" == "---" ]; then
  sketchybar --set $NAME label=""
else
  sketchybar --set $NAME label="${MEETING_LABEL}"
fi
