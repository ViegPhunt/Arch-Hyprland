#!/bin/bash

pacman_packages=(
    hyprland
    ghostty
    nemo
    swww
    waybar
    rofi
    rofi-emoji
    hyprlock
    swaync
    brightnessctl
    network-manager-applet
    bluez
    bluez-utils
    blueman
    fcitx5
    fcitx5-gtk
    fcitx5-qt
    fcitx5-configtool
    fcitx5-bamboo
    discord
    pipewire
    wireplumber
    grim
    slurp
    gnome-text-editor
    cheese
    sddm
    obs-studio
)

aur_packages=(
    wlogout
    hyprshot
    brave-bin
    spotify
    cava
    visual-studio-code-bin
    xdg-desktop-portal-hyprland
    rofi-greenclip
    sddm-sugar-candy-git
)

sudo pacman -S --noconfirm "${pacman_packages[@]}"
yay -S --noconfirm "${aur_packages[@]}"
