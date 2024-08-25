#!/usr/bin/env python3

import sys
import re
from datetime import datetime


def remove_ansi_escape_codes(input_string):
    ansi_escape = re.compile(r"\x1B\[[0-9;]*m")
    return ansi_escape.sub("", input_string)


def get_time_remaining(target_time):
    current_time = datetime.now().strftime("%I:%M")

    current_hour = int(current_time[0:2])
    target_hour = int(target_time[0:2])
    current_mins = int(current_time[3:5])
    target_mins = int(target_time[3:5])
    remaining_mins = 0

    if target_hour > current_hour + 1:
        return "---"

    if target_hour == current_hour and current_mins > target_mins:
        return "---"

    if target_hour == current_hour:
        remaining_mins = target_mins - current_mins

    if target_hour > current_hour or (current_hour == 12 and target_hour == 1):
        remaining_mins = 60 - current_mins
        remaining_mins += target_mins

    if remaining_mins == 0 or remaining_mins > 60:
        return "---"

    return f"{remaining_mins} mins"


log = remove_ansi_escape_codes(sys.argv[1])
lines = log.split("\n")

try:
    for index in range(len(lines)):
        if "---" in lines[index]:
            log = lines[index + 1].strip().replace("Calendar", "-")
            break

    time = log.split("-")[0].strip()
    event = log.split("-")[1].strip()

    print(event.capitalize() + " in " + get_time_remaining(time))

except Exception:
    print("---")
