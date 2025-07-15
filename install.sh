#!/usr/bin/env bash shebang
VERSION="27"
url_repo="https://api.github.com/repos/antti004/linux/contents"
url_installers="https://github.com/antti004/Linux/raw/main/installers"

echo "Version $VERSION"

echo "Install jq and curl"
sudo apt install -y jq curl unzip
sudo apt install -y bc coreutils gawk playerctl
sudo apt autoremove -y

echo "Download installer.sh"
wget -q --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O ~/install.sh


echo "Download dotfiles"
curl "$url_repo/dotfiles" |jq -r '.[].name' |while IFS= read -r name;
do
  wget -q --show-progress "$url_repo/dotfiles/$name" -o ~/$name
done


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

echo "Finished"
