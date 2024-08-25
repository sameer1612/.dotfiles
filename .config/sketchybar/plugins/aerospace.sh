#!/usr/bin/env bash

uppercased_string=$(echo "$FOCUSED_WORKSPACE" | tr '[:lower:]' '[:upper:]')
sketchybar --set $NAME label="$uppercased_string"
