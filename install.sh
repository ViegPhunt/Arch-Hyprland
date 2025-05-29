#!/usr/bin/env bash

clear

echo "==> WELCOME! Now we will install and setup Hyprland on an Arch-based system"
echo "==> Create by Phunt_Vieg_"

cd ~

echo "==> Updating system packages..."
sudo pacman -Syu --noconfirm

echo "==> Setup Terminal"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

echo "==> Make executable"
sudo chmod +x ~/dotfiles/.config/hypr/scripts/*

echo "==> Download wallpaper"
git clone --depth 1 https://github.com/ViegPhunt/Wallpaper-Collection.git ~/Wallpaper-Collection
mkdir -p ~/Pictures/Wallpapers
mv ~/Wallpaper-Collection/Wallpapers/* ~/Pictures/Wallpapers
rm -rf ~/Wallpaper-Collection

echo "==> Install package"
~/dotfiles/.config/hypr/scripts/installpkg.sh

echo "==> PIP Install"
pip3 install Pillow

echo "==> Enable bluetooth"
sudo systemctl enable --now bluetooth

echo "==> Enable networkmanager"
sudo systemctl enable --now NetworkManager

echo "==> Set Ghostty as the default terminal emulator for Nemo"
gsettings set org.cinnamon.desktop.default-applications.terminal exec ghostty

echo "==> Set Cursor"
~/dotfiles/.config/hypr/scripts/setcursor.sh

echo "==> Stow dotfiles"
cd ~/dotfiles
stow -t ~ .
cd ~

echo "==> Check display manager"
DISPLAY_MANAGER_LINK=$(readlink /etc/systemd/system/display-manager.service 2>/dev/null)
if [[ -n "$DISPLAY_MANAGER_LINK" ]]; then
    echo "Display manager already installed: $(basename "$DISPLAY_MANAGER_LINK")"
else
    echo "No display manager found. Set sddm!"
    sudo systemctl enable sddm
    echo -e "[Theme]\nCurrent=sugar-candy" | sudo tee -a /etc/sddm.conf
    echo "sddm has been enabled."
fi

clear

echo
echo "*********************************************************************"
echo "*                    Hyprland setup is complete!                    *"
echo "*                                                                   *"
echo "*   It is recommended to REBOOT your system to apply all changes.   *"
echo "*                                                                   *"
echo "*                 Have a great time with Hyprland!!                 *"
echo "*********************************************************************"
echo
echo
