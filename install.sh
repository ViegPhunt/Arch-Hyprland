#!/usr/bin/bash

echo "WELCOME! Now we will install and setup Hyprland on an Arch-based system"
echo "Create by Phunt_Vieg_"

cd ~

sudo pacman -Syu --noconfirm

echo "Setup Terminal"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

echo "Make executable"
sudo chmod +x ~/dotfiles/.config/hypr/scripts/*

echo "Download wallpaper"
git clone --depth 1 https://github.com/ViegPhunt/Wallpaper-Collection.git ~/Wallpaper-Collection
mkdir -p ~/dotfiles/.config/wallpaper && mv ~/Wallpaper-Collection/Wallpapers/* ~/dotfiles/.config/wallpaper
rm -rf ~/Wallpaper-Collection

echo "Install package"
~/dotfiles/.config/hypr/scripts/installpkg.sh

echo "PIP Install"
pip install Pillow

echo "Enable bluetooth"
sudo systemctl enable --now bluetooth

echo "Enable networkmanager"
sudo systemctl enable --now NetworkManager

echo "Set Cursor"
~/dotfiles/.config/hypr/scripts/setcursor.sh

echo "Setup SDDM"
sudo systemctl enable sddm
echo -e "[Theme]\nCurrent=sugar-candy" | sudo tee -a /etc/sddm.conf

echo "Have a great time with Hyprland!!!"
