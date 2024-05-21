#!/bin/bash

ARCH_PACKAGES=(
  zsh
  neovim
  kitty
  npm
  nodejs
)

if [ "$2" == "-y" ]; then
    CONFIRM="-y"
else
    CONFIRM=""
fi

if [ -z "$1" ]; then
    echo "Error: No distro specified."
    echo "Press any key to exit..."
    read -n 1 _DISCARD
    exit  1
fi

install_package() {
  echo "Installing $1..."

  sudo pacman -Sy $CONFIRM $1
}

for pkg in "${ARCH_PACKAGES[@]}"; do
  if [ "$CONFIRM" ]; then
    install_package $pkg
  else
    echo -n "Install $pkg? [Y/n] : "; read -n 1 confirm_install
    echo ""

    if [ "$confirm_install" == "y" ]; then
      install_package $pkg
    else 
      echo "Skipping $pkg..."
    fi
  fi
done

echo "Installing Oh-My-Zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
