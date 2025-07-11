#!/bin/bash
sudo add-apt-repository universe
sudo apt install fuse  -y # For snap to run
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.appimage
#sudo mkdir /usr/local/bin
chmod u+x nvim-linux-x86_64.appimage
sudo mv nvim-linux-x86_64.appimage /usr/local/bin/nvim
