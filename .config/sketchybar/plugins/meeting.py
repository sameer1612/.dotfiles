#!/usr/bin/env python3

import json, os, subprocess, sys
from datetime import datetime, timezone

result = subprocess.run(
    [
        "/usr/local/bin/ical",
        "list",
        "--from",
        "10 minutes ago",
        "--to",
        "in 6 hours",
        "-o",
        "json",
    ],
    capture_output=True,
    text=True,
)

NAME = os.environ.get("NAME", "meeting")

try:
    events = json.loads(result.stdout) if result.returncode == 0 else []
except json.JSONDecodeError:
    events = []

# Skip all-day events (holidays, etc.)
events = [e for e in events if not e.get("all_day", False)]

if not events:
    subprocess.run(
        ["sketchybar", "--set", NAME, "label=", "background.color=0x00000000"]
    )
    sys.exit(0)

event = events[0]
title = event.get("title", "").strip().rstrip("↻").strip()
title = title[0].upper() + title[1:] if title else title

# Parse ISO 8601 UTC timestamp — replace Z so Python <3.11 can handle it
start_dt = datetime.fromisoformat(event["start_date"].replace("Z", "+00:00"))
now_dt = datetime.now(timezone.utc)

diff_min = int((start_dt - now_dt).total_seconds() / 60)

if diff_min <= 0:
    label = f"{title} (now)"
elif diff_min < 60:
    label = f"{title} in {diff_min}m"
else:
    h, m = divmod(diff_min, 60)
    label = f"{title} in {h}h {m}m"

subprocess.run(["sketchybar", "--set", NAME, "background.color=0x12ffffff"])
subprocess.run(["sketchybar", "--set", NAME, f"label={label}"])
