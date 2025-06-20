#!/bin/bash

DEPS=(
  grim
  slurp
  hyprland
  hyprpicker
  wl-clipboard
  wf-recorder
  jq
  libnotify
  npm
  python3
  nodejs
  rustup
  lua
  fuzzel
  zoxide
  git-delta
)

ARCH_PACKAGES=(
  zsh
  neovim
  kitty
  fish
  foot
  starship
)

install_package() {
  local packages="$*"
  echo "--> Installing $packages..."

  sudo pacman -Sqy $packages --noconfirm --needed
}

echo ""

# Install Dependencies
# if [ "$2" == "-y" ]; then
#   install_package ${DEPS[@]}
# else
#   for pkg in "${DEPS[@]}"; do
#     echo -n "--> Install $pkg? [Y/n] : "; read -n 1 confirm_install
#     echo ""
# 
#     case "$confirm_install" in
#       n|N)
#         echo "--> Skipping $pkg..."
#         ;;
#       *)
#         install_package $pkg
#         ;;
#     esac
#   done
# fi

# Do not ask for dependencies, just install them all directly
install_package "${DEPS[@]}"

echo ""
echo "--> Successfully installed dependencies..."
echo ""

# Install Packages
for pkg in "${ARCH_PACKAGES[@]}"; do
  if [ "$2" == "-y" ]; then
    install_package $pkg
  else
    echo -n "Install $pkg? [Y/n] : "; read -n 1 confirm_install
    echo ""

    case "$confirm_install" in
      n|N)
        echo "--> Skipping $pkg..."
        ;;
      *)
        install_package $pkg
        ;;
    esac
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

caelestia_build_dir="$HOME/source/setup/caelestia"

if [ -d "$caelestia_build_dir" ]; then
  echo "--> Found existing caelestia installation, skipping..."
else
  echo "--> Installing caelestia..."
  mkdir -p "$HOME/source/setup"
  git clone https://github.com/caelestia-dots/shell "$caelestia_build_dir"
  "$caelestia_build_dir/install.fish"
fi

echo ""

echo "Installation complete!"
echo "Press any key to exit..."
read -n 1 _DISCARD
