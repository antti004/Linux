#!/usr/bin/env bash shebang
VERSION="33"
url_repo="https://api.github.com/repos/antti004/linux/contents"
url_installers="https://github.com/antti004/Linux/raw/main/installers"
url_raw="https://github.com/antti004/Linux/raw/main"

if [ "$1" = "upgrade" ]; then
  echo "Download only install.sh"
  wget -q -N --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O ~/install.sh
  exit 1
fi

if [ "$1" = "version" ]; then
  echo "Version $VERSION"
  exit 1
fi

echo "Version $VERSION"

echo "Install jq and curl"
sudo apt install -y jq curl unzip tree tre-command eza duf
sudo apt install -y btop multitail tmux ripgrep fzf
sudo apt install -y bc coreutils gawk playerctl
sudo apt autoremove -y

echo "Download installer.sh"
wget -q -N --show-progress https://github.com/antti004/Linux/raw/main/install.sh -O ~/install.sh


echo "Download dotfiles"
curl "$url_repo/dotfiles" |jq -r '.[].name' |while IFS= read -r name;
do
  # wget -q --show-progress "$url_repo/dotfiles/$name" -o ~/$name
#  curl "$url_repo/dotfiles/$name" > ~/$name
  wget -q -N --show-progress "$url_raw/dotfiles/$name" -O  ~/$name
done



echo "Create or clean .installers directory"
# Create directory .installers if not existsing
mkdir -p ~/.installers
# Delete files from .installers
rm -f ~/.installers/* 2>/dev/null

echo "Download installers ..."
curl "$url_repo/installers" | jq -r '.[].name' | while IFS= read -r name;
do
  wget -q -N --show-progress "$url_installers/$name" -O ~/.installers/$name
done

## Utilities
mkdir -p ~/utils
rm -f ~/utils/* 2>/dev/null
curl "$url_repo/utils" | jq -r '.[].name' | while IFS= read -r name;
do
  wget -q -N --show-progress "$url_raw/utils/$name" -O ~/utils/$name
done






echo "Finished"
