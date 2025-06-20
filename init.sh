#!/bin/bash

if [ -z "$1" ]; then
    echo "Error: No platform specified."
    echo "Press any key to exit..."
    read -n 1 _DISCARD
    exit  1
fi

echo "╭────────────────────────────────────────╮"
echo "│                                        │"
echo "│       (_)__(_)_____________________    │"
echo "│    __/ /__/ /_  ___/_  ___/\ \ /_/     │"
echo "│    _/ /__/ / / /__ _(__  )__> + <      │"
echo "│    /_/  /_/  \___/ /____/  /_/ \_\     │"
echo "│                                        │"
echo "╰────────────────────────────────────────╯"
echo ""
echo "> Welcome to the dotfiles of iicsx!"
echo ""

function nvim() {
  target_dir="$HOME/.config/nvim"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  if [ ! -L "$target_dir" ]; then
    ln -sf "$PWD/nvim/extra" "$target_dir"
    echo "[󰄬] Created nvim directory"
  fi
}

function zsh() {
  target_file="$HOME/.zshrc"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  if [ ! -L "$target_file" ]; then
    ln -sf "$PWD/.zshrc" "$target_file"
    echo "[󰄬] Linked zsh config"
  fi
}

function gitconfig() {
  target_file="$HOME/.gitconfig"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  if [ ! -L "$target_file" ]; then
    ln -sf "$PWD/.gitconfig" "$target_file"
    echo "[󰄬] Linked .gitconfig"
  fi
}

function hypr() {
  target_dir="$HOME/.config/hypr"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  if [ ! -L "$target_dir" ]; then
    ln -sf "$PWD/hypr" "$target_dir"
    echo "[󰄬] Created Hyprland directory"
  fi
}

function kitty() {
  target_dir="$HOME/.config/kitty"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  if [ ! -L "$target_dir" ]; then
    ln -sf "$PWD/kitty" "$target_dir"
    echo "[󰄬] Created kitty directory"
  fi
}

function fish() {
  target_dir="$HOME/.config/fish"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  if [ ! -L "$target_dir" ]; then
    ln -sf "$PWD/fish" "$target_dir"
    echo "[󰄬] Created fish directory"
  fi
}

function foot() {
  target_dir="$HOME/.config/foot"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  if [ ! -L "$target_dir" ]; then
    ln -sf "$PWD/foot" "$target_dir"
    echo "[󰄬] Created foot directory"
  fi
}

function starship() {
  target_file="$HOME/.config/starship.toml"

  if [ -e "$target_file" ]; then
    rm "$target_file"
  fi

  if [ ! -L "$target_file" ]; then
    ln -sf "$PWD/starship.toml" "$target_file"
    echo "[󰄬] Linked starship config"
  fi
}

function fuzzel() {
  target_dir="$HOME/.config/fuzzel"

  echo "$target_dir"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  ln -s "$PWD/fuzzel" "$target_dir"
  echo "[󰄬] Created fuzzel directory"
}

function caelestia() {
  target_dir="$HOME/.config/caelestia"

  if [ -d "$target_dir" ]; then
    rm -rf "$target_dir"
  fi

  if [ ! -L "$target_dir" ]; then
    ln -sf "$PWD/caelestia" "$target_dir"
    echo "[󰄬] Created caelestia directory"
  fi
}

shopt -s nocasematch
echo -n "--> Run preinstall script? [Y/n] : "; read -n 1 confirm_run
case "$confirm_run" in
  n|N)
    echo ""
    echo "--> Skipping preinstall..."
    ;;
  *)
    chmod +x ./preinstall.sh
    ./preinstall.sh
    ;;
esac

METHODS=(
  nvim
  zsh
  gitconfig
  hypr
  caelestia
  kitty
  starship
  fish
  foot
)

for mod in "${METHODS[@]}"; do
  if [ "$2" == "-y" ]; then
    $mod
  else
    echo -n "--> Install $mod? [Y/n] : "; read -n 1 confirm_install

    case "$confirm_install" in
      n|N)
        echo "--> Skipping $mod..."
        ;;
      *)
        $mod
        ;;
    esac
  fi
done
shopt -u nocasematch



echo "--> Press any key to exit..."
read -n 1 _DISCARD
