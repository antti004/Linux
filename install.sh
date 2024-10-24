#!/usr/bin/env bash shebang
wget https://github.com/antti004/Linux/raw/main/.nanorc -O .nanorc
wget https://github.com/antti004/Linux/raw/main/.bash_profile -O .bash_profile
wget https://github.com/antti004/Linux/raw/main/.tmux.conf -O .tmux.conf
wget https://github.com/antti004/Linux/raw/main/install.sh -O install.sh

mkdir -p ~/.installers

wget https://dot.net/v1/dotnet-install.sh -O ~/.installers/dotnet-install.sh
