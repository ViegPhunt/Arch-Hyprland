#!/usr/bin/env bash
set -euo pipefail


start=$(date +%s)
PINK="\e[35m"
WHITE="\e[0m"
YELLOW="\e[33m"
GREEN="\e[32m"
BLUE="\e[34m"

clear

echo -e "
 ${PINK}\e[1mWELCOME!${PINK} Now we will install and setup Hyprland on an Arch-based system
                       Created by \e[1;4mPhunt_Vieg_\e[0m
                          ${PINK}Edited by \e[1;4mGUXXdx${WHITE}
"
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


echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[1/12]${PINK} ==> Updating system packages\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
#sudo pacman -Syu --noconfirm

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[2/12]${PINK} ==> Setup terminal\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo -e ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[3/12]${PINK} ==> Make executable\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo -e ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[4/12]${PINK} ==> Download wallpaper\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[5/12]${PINK} ==> Install package\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[6/12]${PINK} ==> Enable bluetooth\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[7/12]${PINK} ==> Enable networkmanager\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[8/12]${PINK} ==> Set Ghostty as the default terminal emulator for Nemo\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[9/12]${PINK} ==> Apply fonts\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[10/12]${PINK} ==> Set cursor\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[11/12]${PINK} ==> Stow dotfiles\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2
echo ok

echo -e "${PINK}\n---------------------------------------------------------------------\n${YELLOW}[12/12]${PINK} ==> Check display manager\n---------------------------------------------------------------------\n${WHITE}"
sleep 0.2


end=$(date +%s)
duration=$((end - start))

hours=$((duration / 3600))
minutes=$(((duration % 3600) / 60))
seconds=$((duration % 60))

printf -v minutes "%02d" "$minutes"
printf -v seconds "%02d" "$seconds"

clear
                
echo -e "\n\n*********************************************************************
*                    Hyprland setup is complete!                    *
*                                                                   *
*             Duration : $hours hours, $minutes minutes, $seconds seconds            *
*                                                                   *
*   It is recommended to \e[1;4mREBOOT\e[0m your system to apply all changes.   *
*                                                                   *
*                 \e[4mHave a great time with Hyprland!!\e[0m                 *
*********************************************************************\n\n"

