#!/usr/bin/env bash

script_directory="$HOME/.config/caelestia/scripts"
process_name="wayland-idle-inhibitor.py"
pid=$(pidof "$process_name")
icon_dir="$HOME/.config/caelestia/icons"

if [ -n "$pid" ]; then
  pkill -f "$process_name"
  notify-send -u normal -t 3000 --icon="$icon_dir/sleep-off.png" "Idle-Inhibitor" "No longer inhibiting automatic idle"
else
  python3 "$script_directory/$process_name" &
  notify-send -u normal -t 3000 --icon="$icon_dir/sleep.png"  "Idle-Inhibitor" "Now inhibiting automatic idle" 
fi
