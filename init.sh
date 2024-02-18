#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No platform specified."
    echo "Press any key to exit..."
    read -n 1 _DISCARD
    exit  1
fi

shopt -s nocasematch
if [[ "$1" == "win" || "$1" == "windows" ]]; then
    echo "Error: Not Implemented"
fi
if [[ "$1" == "lin" || "$1" == "linux" ]]; then
  target_dir_nvim="$HOME/.config/nvim"

  echo "$target_dir_nvim"

  # remove the directory if it exists
  if [ -d "$target_dir_nvim" ]; then
    rm -rf "$target_dir_nvim"
  fi

  ln -s "$PWD/nvim" "$target_dir_nvim"
  echo "Created nvim directory"

  # other symlinks
fi
shopt -u nocasematch

echo "Press any key to exit..."
read -n 1 _DISCARD
