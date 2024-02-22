#!/usr/bin/env bash

swww init &
swww img ~/source/setup/.dotfiles/wallpapers/neon.png

nm-applet --indicator &

dunst &

waybar &
