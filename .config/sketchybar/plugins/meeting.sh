#!/bin/sh

EVENT_JSON="$(
  /usr/local/bin/ical list --from "10 minutes ago" --to "in 6 hours" -o json
)"

MEETING_LABEL=$(echo "$EVENT_JSON" | jq -r '.[0].title // "---"')
MEETING_LABEL=$(printf "%s" "$MEETING_LABEL" | awk '{print toupper(substr($0,1,1)) substr($0,2)}')

MEETING_START=$(echo "$EVENT_JSON" | jq -r '.[0].start_date // ""')

if [ "$MEETING_LABEL" = "---" ]; then
  sketchybar --set "$NAME" label="" background.color=0x00000000
else
  NOW=$(date -u +%s)
  START=$(date -u -j -f "%Y-%m-%dT%H:%M:%SZ" "$MEETING_START" +%s)

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

  if [ "$DIFF_MIN" -le 10 ]; then
    sketchybar --set "$NAME" label="" background.color=0x00000000
    sketchybar --set "$NAME" label=""
  else
    sketchybar --set "$NAME" background.color=0x12ffffff
    sketchybar --set "$NAME" label="$LABEL"
  fi
fi
