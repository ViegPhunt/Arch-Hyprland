# My Arch-Hyprland
![Arch Linux](https://img.shields.io/badge/Arch-Linux-1793D1?logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/Hyprland-WM-000000?logo=wayland&logoColor=white)

## Table of Contents
- [Preview](#preview)
  - [Videos](#videos)
  - [Screenshots](#screenshots)
- [Notes](#notes)
- [Installation](#installation)
- [Update Dotfiles](#update-dotfiles)
- [Dotfiles Repo](#dotfiles-repo)
- [Wallpapers Repo](#wallpapers-repo)
- [Inspirations](#inspirations)

## Preview
### Videos
[▶️ Watch on YouTube](https://youtu.be/j_eCc8s1v3M)

<https://github.com/user-attachments/assets/8fc6831a-26cc-4415-8005-a533fa1bfb72>

### Screenshots
<p align="center">
    <img src="https://github.com/user-attachments/assets/a004c50a-4001-4596-a48e-97ecc9997843" alt="Image-1.png" width="48%"/>
    <img width="12"/>
    <img src="https://github.com/user-attachments/assets/5d59431c-de0c-487d-bc1a-ea4b2828787a" alt="Image-2.png" width="48%"/>
    <img src="https://github.com/user-attachments/assets/b2b0674f-4709-40d3-bfbe-9c5c5660bf3b" alt="Image-3.png" width="48%"/>
    <img width="12"/>
    <img src="https://github.com/user-attachments/assets/c55950ed-8e7b-4e10-bde3-dd445fbc388b" alt="Image-4.png" width="48%"/>
</p>

## Notes
> [!IMPORTANT]
> `This script automates the installation and setup of my Arch Hyprland environment.`
> - If you want to try it, you should use a minimal profile and backup your system beforehand.

> [!NOTE]
> This script does not include package uninstallation, as some packages may already exist on your system by default. Creating an uninstallation script could potentially affect your current setup.

## Installation
Use this script to install Hyprland on an Arch-based system:
```
git clone --depth=1 https://github.com/ViegPhunt/Arch-Hyprland.git
cd ~/Arch-Hyprland
chmod +x install.sh
./install.sh
```

## Update Dotfiles
To update your dotfiles, you can either run the script locally:
```
cd ~/Arch-Hyprland
chmod +x update.sh
./update.sh
```
Or run it directly from the remote repository:
```
bash -c "$(curl -fSL https://raw.githubusercontent.com/ViegPhunt/Arch-Hyprland/main/update.sh)"
```

## Dotfiles Repo
This repo contains all my dotfiles: [`Dotfiles`](https://github.com/ViegPhunt/Dotfiles).

## Wallpapers Repo
You can find my wallpaper collection in: [`Wallpaper-Collection`](https://github.com/ViegPhunt/Wallpaper-Collection).

## Inspirations
I drew inspiration from the following projects and communities:

- https://www.reddit.com/r/unixporn/
- https://github.com/JaKooLit/Hyprland-Dots
- https://github.com/Hyde-project/hyde
- https://github.com/mylinuxforwork/dotfiles

and more...

## Feedback
If you find this repo useful or have any suggestions, feel free to open an issue or submit a pull request. Happy ricing! 🍚
