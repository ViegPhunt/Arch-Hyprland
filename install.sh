#!/usr/bin/bash

echo "WELCOME! Now we will install and setup Hyprland on an Arch-based system"
echo "Create by Phunt_Vieg_"

sudo pacman -Syu --noconfirm

cd ~

echo "Setup Terminal"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

echo "Install package"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/Arch-Hyprland/refs/heads/main/dotfiles/hypr/.config/hypr/scripts/installpkg.sh)"

echo "PIP Install"
pip install Pillow

echo "Enable bluetooth"
sudo systemctl enable --now bluetooth

echo "Install JetBrainsMono Nerd Font"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip JetBrainsMono.zip
rm JetBrainsMono.zip
fc-cache -fv
cd ~

echo "Stow dotfiles"
git clone https://github.com/ViegPhunt/Arch-Hyprland.git ~/Arch-Hyprland
mkdir -p ~/dotfiles && mv ~/Arch-Hyprland/dotfiles/* ~/dotfiles/
rm -rf ~/Arch-Hyprland
git clone https://github.com/ViegPhunt/Wallpaper-Collection.git
mkdir -p ~/dotfiles/wallpaper/.config/wallpaper && mv ~/Wallpaper-Collection/Wallpapers/* ~/dotfiles/wallpaper/.config/wallpaper
rm -rf ~/Wallpaper-Collection
cd ~/dotfiles
stow ghostty hypr rofi swww wallpaper waybar wlogout
cd ~

echo "Setup SDDM"
sudo systemctl enable --now sddm
echo -e "[Theme]\nCurrent=sugar-candy" | sudo tee -a /etc/sddm.conf

echo "Have a great time with Hyprland!!!"
