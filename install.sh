#!/usr/bin/bash

echo "WELCOME! Now we will install and setup Hyprland on an Arch-based system"
echo "Create by Phunt_Vieg_"

sudo pacman -Syu --noconfirm

cd ~

echo "Setup Terminal"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

echo "Install package"
sudo pacman -S --noconfirm hyprland ghostty nemo swww waybar rofi rofi-emoji hyprlock swaync brightnessctl network-manager-applet bluez bluez-utils blueman fcitx5 fcitx5-gtk fcitx5-qt fcitx5-configtool fcitx5-bamboo discord pipewire wireplumber grim slurp
yay -S --noconfirm wlogout hyprshot brave-bin spotify cava visual-studio-code-bin obs xdg-desktop-portal-hyprland

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

echo "Have a great time with Hyprland!!!"
