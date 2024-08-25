#!/usr/bin/env python3

import sys
import re
from datetime import datetime, timedelta


def remove_ansi_escape_codes(input_string):
    ansi_escape = re.compile(r"\x1B\[[0-9;]*m")
    return ansi_escape.sub("", input_string)


def get_time_remaining(target_time):
    now = datetime.now()

    target = datetime.strptime(target_time, "%H:%M").replace(
        year=now.year, month=now.month, day=now.day
    )

    if target < now:
        target += timedelta(hours=12)

    remaining_time = target - now
    hours, remainder = divmod(remaining_time.seconds, 3600)
    minutes = remainder // 60

    if hours >= 1 or minutes == 0:
        return "---"

    return f"{minutes} mins"


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
