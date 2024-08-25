# !/bin/sh

MEETING_LABEL="$(~/.config/sketchybar/plugins/meeting-label.py "$(mcal list)")"

if [ "$MEETING_LABEL" == "---" ]; then
  sketchybar --set $NAME label=""
  sketchybar --set $NAME background.color=0x00000000
else
  sketchybar --set $NAME background.color=0x12ffffff
  sketchybar --set $NAME label="${MEETING_LABEL}"
fi
