#!/bin/bash

DEPS=(
  grim
  slurp
  hyprctl
  hyprpicker
  wl-copy
  wf-recorder
  jq
  notify-send
  npm
  python3
  nodejs
  rustup
  lua
)

ARCH_PACKAGES=(
  zsh
  neovim
  kitty
  fish
  foot
)

install_package() {
  echo "--> Installing $1..."

  sudo pacman -Sy $1 --noconfirm
}

# Install Dependencies
if [ "$2" == "-y" ]; then
  install_package ${DEPS[@]}
else
  for pkg in "${DEPS[@]}"; do
    echo -n "--> Install $pkg? [Y/n] : "; read -n 1 confirm_install
    echo ""

    if [ "$confirm_install" == "y"]; then
      install_package $pkg
    else 
      echo "--> Skipping $pkg..."
    fi
  done
fi

# Install Packages
for pkg in "${ARCH_PACKAGES[@]}"; do
  if [ "$2" == "-y" ]; then
    install_package $pkg
  else
    echo -n "Install $pkg? [Y/n] : "; read -n 1 confirm_install
    echo ""

    if [ "$confirm_install" == "y" ]; then
      install_package $pkg
    else 
      echo "--> Skipping $pkg..."
    fi
  fi
done

# echo "Installing Oh-My-Zsh"
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
# 
# echo ""
# 
# echo "Installing yazi-fm"
# cargo install yazi-fm

echo "--> Installing caelestia..."
mkdir -p "$HOME/source/setup"
git clone https://github.com/caelestia-dots/shell "$HOME/source/setup/caelestia"
"./$HOME/source/setup/caelestia/install.fish"

echo ""

echo "Installation complete!"
echo "Press any key to exit..."
read -n 1 _DISCARD
