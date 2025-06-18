#!/usr/bin/env bash

script_directory="$HOME/.config/caelestia/scripts"
process_name="wayland-idle-inhibitor.py"
pid=$(pidof "$process_name")

if [ -n "$pid" ]; then
  pkill -f "$process_name"
  notify-send -u normal --icon=/home/nex/.config/caelestia/scripts/sleep-off.png "Idle-Inhibitor" "No longer inhibiting automatic idle"
else
  python3 "$script_directory/$process_name" &
  notify-send -u normal --icon=/home/nex/.config/caelestia/scripts/sleep.png  "Idle-Inhibitor" "Now inhibiting automatic idle" 
fi
