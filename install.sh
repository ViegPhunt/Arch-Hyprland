#!/usr/bin/bash

echo "WELCOME! Now we will install and setup Hyprland on an Arch-based system"
echo "Create by Phunt_Vieg_"

cd ~

sudo pacman -Syu --noconfirm

echo "Make executable"
sudo chmod +x ~/Arch-Hyprland/dotfiles/hypr/.config/hypr/scripts/*

echo "Setup Terminal"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

echo "Install package"
~/Arch-Hyprland/dotfiles/hypr/.config/hypr/scripts/installpkg.sh

echo "PIP Install"
pip install Pillow

echo "Enable bluetooth"
sudo systemctl enable --now bluetooth

echo "Enable networkmanager"
sudo systemctl enable --now NetworkManager

echo "Set Cursor"
~/Arch-Hyprland/dotfiles/hypr/.config/hypr/scripts/setcursor.sh

echo "Stow dotfiles"
mkdir -p ~/dotfiles && mv ~/Arch-Hyprland/dotfiles/* ~/dotfiles/
git clone https://github.com/ViegPhunt/Wallpaper-Collection.git ~/Wallpaper-Collection
mkdir -p ~/dotfiles/wallpaper/.config/wallpaper && mv ~/Wallpaper-Collection/Wallpapers/* ~/dotfiles/wallpaper/.config/wallpaper
rm -rf ~/Wallpaper-Collection
cd ~/dotfiles
stow ghostty hypr rofi swww wallpaper waybar wlogout
cd ~

echo "Setup SDDM"
sudo systemctl enable sddm
echo -e "[Theme]\nCurrent=sugar-candy" | sudo tee -a /etc/sddm.conf

echo "Have a great time with Hyprland!!!"
