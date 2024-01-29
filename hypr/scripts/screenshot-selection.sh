#!/bin/bash

grim -g "$(slurp)" - | wl-copy -t image/png
notify-send 'Screenshot' -i 
