#!/usr/bin/env python3

import sys
import re
from datetime import datetime, timedelta


def remove_ansi_escape_codes(input_string):
    ansi_escape = re.compile(r"\x1B\[[0-9;]*m")
    clean_string = ansi_escape.sub("", input_string)

    return clean_string


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

    if minutes == 0:
        return f"{hours}h"

    if hours == 0:
        return f"{minutes}m"

    return f"{hours}h {minutes}m "


log = sys.argv[1]

for line in log.split("\n"):
    if "Calendar" in line:
        log = line.strip().replace("Calendar", "-")
        break

time = remove_ansi_escape_codes(log.split("-")[0]).strip()
event = remove_ansi_escape_codes(log.split("-")[1]).strip()

print(event + " in " + get_time_remaining(time))
