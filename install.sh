#!/usr/bin/env bash shebang
VERSION="2.1"
url_repo="https://api.github.com/repos/antti004/linux/contents"
url_installers="https://github.com/antti004/Linux/raw/main/installers"

echo "Version $VERSION"

wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bashrc -O ~/.bashrc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.nanorc -O ~/.nanorc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.zshrc -O ~/.zshrc

wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bash_profile -O ~/.bash_profile
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.tmux.conf -O ~/.tmux.conf
wget -q --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O ~/install.sh

# Create directory .installers if not existsing
mkdir -p ~/.installers
# Delete files from .installers
rm ~/.installers/*

curl "$url_repo/installers" | jq -r '.[].name' | while IFS= read -r name;
do
  wget -q --show-progress "$url_installers/$name" -O- ~/.installers/$name
done
