#!/usr/bin/env bash
set -euo pipefail

echo "Updating config..."

rm -rf ~/dotfiles

git clone --depth=1 -q https://github.com/ViegPhunt/Dotfiles.git ~/dotfiles
git clone --depth=1 -q https://github.com/tmux-plugins/tpm ~/dotfiles/.tmux/plugins/tpm

cd ~/dotfiles
rm -rf .git README.md LICENSE

echo
echo "==> Config update completed!"
echo "==> It is recommended to RELOGIN to apply all changes."
echo
