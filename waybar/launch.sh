#!/bin/sh

killall waybar

if [[ $USER = "nex" ]]
then
  waybar -c ~/.config/waybar/config & -s ~/.config/waybar/style.css
else
  waybar &
fi
