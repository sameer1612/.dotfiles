#!/usr/bin/env python3

import sys
import re
from datetime import datetime, timedelta


def remove_ansi_escape_codes(input_string):
    ansi_escape = re.compile(r"\x1B\[[0-9;]*m")
    return ansi_escape.sub("", input_string)


def get_time_remaining(target_time):
    current_time = datetime.now().strftime("%I:%M")

    if current_time[0:2] != target_time[0:2]:
        return "---"

    remaining_mins = int(target_time[3:5]) - int(current_time[3:5])

    if remaining_mins > 0:
        return f"{remaining_mins} mins"
    else:
        return "---"


log = remove_ansi_escape_codes(sys.argv[1])
lines = log.split("\n")

for index in range(len(lines)):
    if "---" in lines[index]:
        log = lines[index + 1].strip().replace("Calendar", "-")
        break

time = log.split("-")[0].strip()
event = log.split("-")[1].strip()

time_remaining = get_time_remaining(time)

if time_remaining == "---":
    print("---")
else:
    print(event + " in " + time_remaining)
