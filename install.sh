#!/usr/bin/env bash shebang
echo Version 1.4
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.nanorc -O .nanorc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bash_profile -O .bash_profile
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.tmux.conf -O .tmux.conf
wget -q --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O install.sh

mkdir -p ~/.installers

wget -q --show-progress https://github.com/antti004/Linux/raw/main/Installers/install-dotnet.sh -O ~/.installers/install-dotnet.sh
wget -q --show-progress https://github.com/antti004/Linux/raw/main/Installers/install-docker.sh -O ~/.installers/install-docker.sh

