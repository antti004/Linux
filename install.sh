#/bin/bash
wget https://github.com/antti004/Linux/raw/main/.nanorc -O .nanorc
wget https://github.com/antti004/Linux/raw/main/.bash_profile -O .bash_profile
wget https://github.com/antti004/Linux/raw/main/.tmux.conf -O .tmux.conf
wget https://github.com/antti004/Linux/raw/main/install.sh -O install.sh

mkdir ~/.install_scripts
echo "Reload...."
source ~/.bashrc
source ~/.bash_profile
