#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No platform specified."
    echo "Press any key to exit..."
    read -n 1 _DISCARD
    exit  1
fi

echo "╭──────────────────────────────────╮"
echo "│    (_)__(_)_____________________ │"
echo "│ __/ /__/ /_  ___/_  ___/\ \ /_/  │"
echo "│ _/ /__/ / / /__ _(__  )__> + <   │"
echo "│ /_/  /_/  \___/ /____/  /_/ \_\  │"
echo "╰──────────────────────────────────╯"
echo ""
echo "> Welcome to the dotfiles of iicsx!"
echo ""

function nvim() {
  target_dir="$HOME/.config/nvim"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/nvim" "$target_dir"
  echo "[󰄬] Created nvim directory"
}

function zsh() {
  target_file="$HOME/.zshrc"

  echo "$target_file"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  ln -s "$PWD/.zshrc" "$target_file"
  echo "[󰄬] Linked zsh config"
}

function gitconfig() {
  target_file="$HOME/.gitconfig"

  echo "$target_file"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  ln -s "$PWD/.gitconfig" "$target_file"
  echo "[󰄬] Linked .gitconfig"
}

function hypr() {
  target_dir="$HOME/.config/hypr"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/hypr" "$target_dir"
  echo "[󰄬] Created Hyprland directory"
}

function kitty() {
  target_dir="$HOME/.config/kitty"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/kitty" "$target_dir"
  echo "[󰄬] Created kitty directory"
}

function starship() {
  target_file="$HOME/.config/starship.toml"

  echo "$target_file"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  ln -s "$PWD/starship.toml" "$target_file"
  echo "[󰄬] Linked starship config"
}

function caelestia() {
  target_dir="$HOME/.config/caelestia"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/caelestia" "$target_dir"
  echo "[󰄬] Created caelestia directory"
}

shopt -s nocasematch
echo -n "--> Run preinstall script? [Y/n] : "; read -n 1 confirm_run
if [ "$confirm_run" == "y" ]; then
  chmod +x ./preinstall.sh
  ./preinstall.sh
else 
  echo "--> Skipping preinstall..."
fi

METHODS=(
  nvim
  zsh
  gitconfig
  hypr
  caelestia
  kitty
  starship
)

for mod in "${METHODS[@]}"; do
  if [ "$2" == "-y" ]; then
    $mod
  else
    echo -n "--> Install $mod? [Y/n] : "; read -n 1 confirm_install
    echo ""

    if [ "$confirm_install" == "y" ]; then
      install_package $mod
    else 
      echo "--> Skipping $mod..."
    fi
  fi
done
shopt -u nocasematch



echo "--> Press any key to exit..."
read -n 1 _DISCARD
