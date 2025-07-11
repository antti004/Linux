#!/bin/bash
sudo add-apt-repository universe
sudo apt install fuse # For snap to run
wget https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
sudo mkdir /usr/local/bin
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim
