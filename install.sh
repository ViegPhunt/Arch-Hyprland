#!/usr/bin/env bash
set -euo pipefail


echo "==> Download Nix"
sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon


CURRENT_SHELL=$(basename "$SHELL")
case "$CURRENT_SHELL" in
    bash) SHELL_RC="$HOME/.bashrc" ;;
    zsh) SHELL_RC="$HOME/.zshrc" ;;
    fish) SHELL_RC="$HOME/.config/fish/config.fish" ;;
    *) SHELL_RC="$HOME/.profile" ;;
esac

echo "==> Add setup line to $SHELL_RC"
LINE='~/Arch-Hyprland/setup.sh'
if ! grep -Fxq "$LINE" "$SHELL_RC"; then
    echo -e "\n$LINE" | tee -a "$SHELL_RC"
fi

cd ~/Arch-Hyprland
chmod +x setup.sh
cd ~


echo
echo "*******************************************************"
echo "*    Please restart your terminal (or your system)    *"
echo "*       to apply the changes and continue setup       *"
echo "*******************************************************"
echo