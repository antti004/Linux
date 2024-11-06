#!/usr/bin/env bash shebang
echo Version 1.8
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bashrc -O ~/.bashrc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.nanorc -O ~/.nanorc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bash_profile -O ~/.bash_profile
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.tmux.conf -O ~/.tmux.conf
wget -q --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O ~/install.sh


echo ## Create .installer directory
mkdir -p ~/.installers
echo ## Delete files in .installer directory
rm ~/.installers/*

wget -q --show-progress https://github.com/antti004/Linux/raw/main/installers/install-dotnet.sh -O ~/.installers/install-dotnet.sh
wget -q --show-progress https://github.com/antti004/Linux/raw/main/installers/install-docker.sh -O ~/.installers/install-docker.sh

