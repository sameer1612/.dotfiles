#!/bin/sh

# time_to_minutes() {
#     local time=$1
#     local hours=${time%:*}
#     local minutes=${time#*:}
#     echo $((10#$hours * 60 + 10#$minutes))
# }
#
# # Check if two arguments are provided
# if [ "$#" -ne 2 ]; then
#     echo "Usage: $0 <start_time> <end_time>"
#     echo "Example: $0 10:43 11:43"
#     exit 1
# fi
#
# start_time=$1
# end_time=$2
#
# # Convert times to minutes since midnight
# start_minutes=$(time_to_minutes "$start_time")
# end_minutes=$(time_to_minutes "$end_time")
#
# # Calculate the duration in minutes
# duration_minutes=$((end_minutes - start_minutes))
#
# # Convert duration to hours and minutes
# hours=$((duration_minutes / 60))
# minutes=$((duration_minutes % 60))
#
# output=""
# [ $hours -ne 0 ] && output="${hours}h"
# [ $minutes -ne 0 ] && output="${output}${minutes}m"
#
# # Print the result
# echo "$output"

MEETING_LABEL="$(mcal list | awk '/---/{getline; print}' | sed 's/\x1b\[[0-9;]*m//g' | tr -d '[:space:]' | sed 's/Calendar/ - /')"

sketchybar --set $NAME label.padding_right=20

if [ "$MEETING_LABEL" == "---" ]; then
  sketchybar --set $NAME label=""
  sketchybar --set $NAME icon=""
else
  sketchybar --set $NAME label="${MEETING_LABEL}"
  sketchybar --set $NAME icon="􀉫"
fi
