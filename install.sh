#!/usr/bin/env bash shebang
VERSION="25"
url_repo="https://api.github.com/repos/antti004/linux/contents"
url_installers="https://github.com/antti004/Linux/raw/main/installers"

echo "Version $VERSION"

echo "Install jq and curl"
sudo apt install -y jq curl
sudo apt autoremove

echo "Download dot files"
wget -q --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O ~/install.sh
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bashrc -O ~/.bashrc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.nanorc -O ~/.nanorc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.zshrc -O ~/.zshrc
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.bash_profile -O ~/.bash_profile
wget -q --show-progress https://github.com/antti004/Linux/raw/main/.tmux.conf -O ~/.tmux.conf

echo "Create or clean .installers directory"
# Create directory .installers if not existsing
mkdir -p ~/.installers
# Delete files from .installers
rm -f ~/.installers/* 2>/dev/null

echo "Download installers ..."
curl "$url_repo/installers" | jq -r '.[].name' | while IFS= read -r name;
do
  wget -q --show-progress "$url_installers/$name" -O ~/.installers/$name
done

echo "Done"
