#!/usr/bin/env bash shebang
echo Version 1.1
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.nanorc -O .nanorc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bash_profile -O .bash_profile
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.tmux.conf -O .tmux.conf
wget -q --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O install.sh

mkdir -p ~/.installers

wget -q --show-progress  https://dot.net/v1/dotnet-install.sh -O ~/.installers/dotnet-install.sh
