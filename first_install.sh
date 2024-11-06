#!/bin/bash
clear
echo Version 0.1
apt-get update
apt-get -y dist-upgrade
apt-get install -y zsh htop vim git tmux apt-transport-https zip unzip software-properties-common multitail
# File managers
sudo apt install -y ncdu eza
sudo apt install -y httpie

sudo chsh -s $(which zsh) $USER

sh -c "echo Europe/Tallinn > /etc/timezone"
rm -f /etc/localtime
ln -sf /usr/share/zoneinfo/Europe/Tallinn /etc/localtime

# install fzf (file finder)
cd
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
