#!/usr/bin/env bash
set -euo pipefail

# Variables
PINK="\e[35m"
WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"


clear

# Welcome message
echo -e "${PINK}\e[1m
 WELCOME!${PINK} Now we will install and setup Hyprland on an Arch-based system
                       Created by \e[1;4mPhunt_Vieg_
${WHITE}"

# Warning message
echo -e "${PINK}
 *********************************************************************
 *                         ⚠️  \e[1;4mWARNING\e[0m${PINK}:                              *
 *               This script will modify your system!                *
 *         It will install Hyprland and several dependencies.        *
 *      Make sure you know what you are doing before continuing.     *
 *********************************************************************
\n
"

# Asking if the user want to proceed
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

# Start of the install procedure
cd ~

# Full system update
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[1/11]${PINK} ==> Updating system packages\n---------------------------------------------------------------------\n${WHITE}"
sudo pacman -Syu --noconfirm

# Lunch auto-setup script and dl all the dotfiles
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[2/11]${PINK} ==> Setup terminal\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.5
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/auto-setup-LT/main/arch.sh)"

# Making all the scripts executable (not sure we need this one to be a bullet point)
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[3/11]${PINK} ==> Make executable\n---------------------------------------------------------------------\n${WHITE}"
sudo chmod +x ~/dotfiles/.config/viegphunt/*

# download & mv the wallpapers in the right directory
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[4/11]${PINK} ==> Download wallpaper\n---------------------------------------------------------------------\n${WHITE}"
git clone --depth 1 https://github.com/ViegPhunt/Wallpaper-Collection.git ~/Wallpaper-Collection
mkdir -p ~/Pictures/Wallpapers
mv ~/Wallpaper-Collection/Wallpapers/* ~/Pictures/Wallpapers
rm -rf ~/Wallpaper-Collection

# Install the required packages
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[5/11]${PINK} ==> Install package\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.5
~/dotfiles/.config/viegphunt/install_archpkg.sh

# enable bluetooth & networkmanager
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[6/11]${PINK} ==> Enable bluetooth & networkmanager\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.5
sudo systemctl enable --now bluetooth
sudo systemctl enable --now NetworkManager

# Set Ghostty as default terminal emulator for Nemo
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[7/11]${PINK} ==> Set Ghostty as the default terminal emulator for Nemo\n---------------------------------------------------------------------\n${WHITE}"
gsettings set org.cinnamon.desktop.default-applications.terminal exec ghostty

# Apply fonts
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[8/11]${PINK} ==> Apply fonts\n---------------------------------------------------------------------\n${WHITE}"
fc-cache -fv

# Set cursor
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[9/11]${PINK} ==> Set cursor\n---------------------------------------------------------------------\n${WHITE}"
~/dotfiles/.config/viegphunt/setcursor.sh

# Stow
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[10/11]${PINK} ==> Stow dotfiles\n---------------------------------------------------------------------\n${WHITE}"
cd ~/dotfiles
stow -t ~ .
cd ~

# Check display manager
echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[11/11]${PINK} ==> Check display manager\n---------------------------------------------------------------------\n${WHITE}"
if [[ ! -e /etc/systemd/system/display-manager.service ]]; then
    sudo systemctl enable sddm
    echo -e "[Theme]\nCurrent=sddm-astronaut-theme" | sudo tee -a /etc/sddm.conf
    sudo sed -i 's|astronaut.conf|purple_leaves.conf|' /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop
    echo -e "\n${PINK}SDDM has been enabled."
fi

# Wait a little just for the last message
sleep 0.7
clear


echo -e "\n
 *********************************************************************
 *                    Hyprland setup is complete!                    *
 *                                                                   *
 *                                                                   *
 *   It is recommended to \e[1;4mREBOOT\e[0m your system to apply all changes.   *
 *                                                                   *
 *                 \e[4mHave a great time with Hyprland!!${WHITE}                 *
 *********************************************************************
 \n
"

