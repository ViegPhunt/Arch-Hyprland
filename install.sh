#!/usr/bin/env bash
set -euo pipefail


PINK="\e[35m"
WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"

clear

echo "==> WELCOME! Now we will install and setup Hyprland on an Arch-based system"
echo "==> Create by Phunt_Vieg_"


cd
echo -e "${YELLOW} Do you still want to continue with Hyprland installation using this script? [y/N]: \n"

read -r confirm
case "$confirm" in
    [yY][eE][sS]|[yY])
        echo -e "\n${GREEN}[OK]${PINK} ==> Continuing with installation..."
        ;;
    *)
        echo -e "${BLUE}[NOTE]${PINK} ==> You 🫵 chose ${YELLOW}NOT${PINK} to proceed.. Exiting..."
        echo
        exit 1
        ;;
esac
 ~

echo "==> Updating system packages"
sudo pacman -Syu --noconfirm

echo "==> Setup terminal"
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

echo "==> Make executable"
sudo chmod +x ~/dotfiles/.config/viegphunt/*

echo "==> Download wallpaper"
git clone --depth 1 https://github.com/ViegPhunt/Wallpaper-Collection.git ~/Wallpaper-Collection
mkdir -p ~/Pictures/Wallpapers
mv ~/Wallpaper-Collection/Wallpapers/* ~/Pictures/Wallpapers
rm -rf ~/Wallpaper-Collection

echo "==> Install package"
~/dotfiles/.config/viegphunt/install_archpkg.sh

echo "==> Enable bluetooth"
sudo systemctl enable --now bluetooth

echo "==> Enable networkmanager"
sudo systemctl enable --now NetworkManager

echo "==> Set Ghostty as the default terminal emulator for Nemo"
gsettings set org.cinnamon.desktop.default-applications.terminal exec ghostty

echo "==> Apply fonts"
fc-cache -fv

echo "==> Set cursor"
~/dotfiles/.config/viegphunt/setcursor.sh

echo "==> Stow dotfiles"
cd ~/dotfiles
stow -t ~ .
cd ~

echo "==> Check display manager"
if [[ ! -e /etc/systemd/system/display-manager.service ]]; then
    sudo systemctl enable sddm
    echo -e "[Theme]\nCurrent=sddm-astronaut-theme" | sudo tee -a /etc/sddm.conf
    sudo sed -i 's|astronaut.conf|purple_leaves.conf|' /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
    echo "SDDM has been enabled."
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
