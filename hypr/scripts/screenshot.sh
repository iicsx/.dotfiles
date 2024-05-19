#!/bin/bash

FILE_NAME="screenshot-$(date +%F-%T).png"
mkdir -p "${HOME}/Images/screenshots"
FILE_PATH="${HOME}/Images/screenshots/${FILE_NAME}"
grim -t png "${FILE_PATH}"
notify-send 'Screenshot' -i "${FILE_PATH}" "${FILE_NAME}"
