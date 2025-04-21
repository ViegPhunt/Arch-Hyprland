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
    nwg-look
    cheese
    sddm
    obs-studio
    pavucontrol
    qt5ct
    qt6ct
    adw-gtk-theme
)

aur_packages=(
    wlogout
    hyprshot
    xdg-desktop-portal-hyprland
    cava
    spotify
    rofi-greenclip
    visual-studio-code-bin
    cursor-bin
    sublime-text-4
    brave-bin
    zen-browser-bin
    sddm-sugar-candy-git
    apple_cursor
    whitesur-icon-theme
    ttf-jetbrains-mono-nerd
)

sudo pacman -S --noconfirm "${pacman_packages[@]}"
yay -S --noconfirm "${aur_packages[@]}"
