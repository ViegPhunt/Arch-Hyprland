#!/usr/bin/bash

mkdir -p ~/.icons/default/
touch ~/.icons/default/index.theme
echo "[icon theme]" >> ~/.icons/default/index.theme
echo "Inherits=macOS" >> ~/.icons/default/index.theme
sudo rm -rf /usr/share/icons/default/index.theme
sudo cp ~/.icons/default/index.theme /usr/share/icons/default/
