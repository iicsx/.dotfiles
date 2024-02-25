#!/usr/bin/env bash

swww init &
swww img ~/source/setup/.dotfiles/wallpapers/ascii_cat.png

nm-applet --indicator &

dunst &

waybar &
