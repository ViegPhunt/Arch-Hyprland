# My Arch-Hyprland Install Script
This script automates install and setup my Arch Hyprland

## Necessary
> [!IMPORTANT]
> Install a backup tool and create a system backup before using this script.

> [!NOTE]
> This script does not include package uninstallation, as some packages may have already been installed on your system by default. Creating a package uninstallation script could potentially affect your previous system.


## Installation
Using this script to install Hyprland on an Arch-based system
```
sudo pacman -Syu --noconfirm
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/Arch-Hyprland/main/install.sh)"
```
Or
```
git clone --depth=1 https://github.com/ViegPhunt/Arch-Hyprland.git ~/Arch-Hyprland
cd ~/Arch-Hyprland
chmod +x install.sh
./install.sh
```
