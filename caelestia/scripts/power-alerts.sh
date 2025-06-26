#!/usr/bin/env bash

icon_dir="$HOME/.config/caelestia/icons"

BATTERY_PATH="/sys/class/power_supply/BAT0"
STATE_FILE="/tmp/battery_warning_state"

capacity=$(cat "$BATTERY_PATH/capacity")
battery_status=$(cat "$BATTERY_PATH/status")

last_notified=100
if [[ -f "$STATE_FILE" ]]; then
  last_notified=$(cat "$STATE_FILE")
fi

echo "$last_notified"

if [[ "$battery_status" == "Discharging" ]]; then
  # alert critical levels
  critical=10
  if (( capacity <= critical && last_notified > critical )); then
    notify-send -u critical --icon="$icon_dir/battery-alert.png" "Battery Critical" "Battery is at ${capacity}%. Please plug in your charger."
    echo "$critical" > "$STATE_FILE"
    exit
  fi

  # alert warning levels
  warning=20
  if (( capacity <= warning && last_notified > warning )); then
    notify-send -u normal --icon="$icon_dir/power-plug.png" "Battery Low" "Battery is at ${capacity}%. Please plug in your charger."
    echo "$warning" > "$STATE_FILE"
    exit
  fi
else
  # Clear state if charging
  echo "100" > "$STATE_FILE"
fi

