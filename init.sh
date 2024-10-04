#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No platform specified."
    echo "Press any key to exit..."
    read -n 1 _DISCARD
    exit  1
fi

function nvim() {
  target_dir="$HOME/.config/nvim"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/nvim" "$target_dir"
  echo "Created nvim directory"
}

function zsh() {
  target_file="$HOME/.zshrc"

  echo "$target_file"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  ln -s "$PWD/.zshrc" "$target_file"
  echo "Linked zsh config"
}

function gitconfig() {
  target_file="$HOME/.gitconfig"

  echo "$target_file"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  ln -s "$PWD/.gitconfig" "$target_file"
  echo "Linked .gitconfig"
}

function hypr() {
  target_dir="$HOME/.config/hypr"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/hypr" "$target_dir"
  echo "Created Hyprland directory"
}

function kitty() {
  target_dir="$HOME/.config/kitty"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/kitty" "$target_dir"
  echo "Created kitty directory"
}

function starship() {
  target_file="$HOME/.config/starship.toml"

  echo "$target_file"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  ln -s "$PWD/starship.toml" "$target_file"
  echo "Linked starship config"
}

function waybar() {
  target_dir="$HOME/.config/waybar"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/waybar" "$target_dir"
  echo "Created Waybar directory"
}

function wofi() {
  target_dir="$HOME/.config/wofi"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/wofi" "$target_dir"
  echo "Created Wofi directory"
}

function firefox() {
  target_file="$HOME/.mozilla/firefox/sws4h8xy.default-release/chrome/userChrome.css"

  echo "$target_file"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  ln -s "$PWD/firefox/userCrome.css" "$target_file"
  echo "Linked userChrome file"
}

function yazi() {
  target_dir="$HOME/.config/yazi"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/yazi" "$target_dir"
  echo "Created Yazi directory"
}

shopt -s nocasematch
if [[ "$1" == "win" || "$1" == "windows" ]]; then
    echo "Error: Not Implemented"
fi
if [[ "$1" == "lin" || "$1" == "linux" ]]; then
  nvim
  zsh
  gitconfig
  hypr
  kitty
  starship
  waybar
  wofi
  firefox

  # other symlinks
fi
shopt -u nocasematch

echo "Press any key to exit..."
read -n 1 _DISCARD
