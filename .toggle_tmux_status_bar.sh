#!/bin/bash

# Get the current status of the Tmux status bar
status=$(tmux show-option -g status | awk '{print $NF}')

# Toggle the status
if [ "$status" == "on" ]; then
    tmux set-option -g status off
else
    tmux set-option -g status on
fi

