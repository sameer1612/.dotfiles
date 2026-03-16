#!/bin/sh

OUTPUT=$(/usr/local/bin/ical list --from "10 minutes ago" --to "in 6 hours" 2>/dev/null)

# Get first event row (rows where the first │-delimited field is a number)
ROW=$(echo "$OUTPUT" | awk -F'│' '$2 ~ /^[[:space:]]*[0-9]+[[:space:]]*$/ {print; exit}')

if [ -z "$ROW" ]; then
  sketchybar --set "$NAME" label="" background.color=0x00000000
  exit 0
fi

# Extract start time (first HH:MM from the time column) — already local time, no tz conversion needed
START_TIME=$(echo "$ROW" | awk -F'│' '{print $3}' | grep -o '[0-9]\{2\}:[0-9]\{2\}' | head -1)

# Extract and clean title (strip leading/trailing space and recurring indicator ↻)
MEETING_LABEL=$(echo "$ROW" | awk -F'│' '{print $4}' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//' | sed 's/[[:space:]]*↻[[:space:]]*$//')
MEETING_LABEL=$(printf "%s" "$MEETING_LABEL" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')

# Compute diff using local time directly — no timezone parsing
NOW=$(date +%s)
START=$(date -j -f "%H:%M" "$START_TIME" +%s)

# Handle day rollover (e.g. 11pm with a meeting at 1am next day)
if [ $((START - NOW)) -lt -1800 ]; then
  START=$((START + 86400))
fi

DIFF_MIN=$(((START - NOW) / 60))

if [ "$DIFF_MIN" -le 0 ]; then
  LABEL="$MEETING_LABEL (now)"
elif [ "$DIFF_MIN" -lt 60 ]; then
  LABEL="$MEETING_LABEL in ${DIFF_MIN}m"
else
  H=$((DIFF_MIN / 60))
  M=$((DIFF_MIN % 60))
  LABEL="$MEETING_LABEL in ${H}h ${M}m"
fi

sketchybar --set "$NAME" background.color=0x12ffffff
sketchybar --set "$NAME" label="$LABEL"
