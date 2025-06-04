# 2025-06-04
## Created.
VERSION="1.0"
echo "Version $VERSION"
echo "Update all"
apt update
apt -y dist-upgrade

echo "Set region settings"
sh -c "echo Europe/Tallinn > /etc/timezone"
rm -f /etc/localtime
ln -sf /usr/share/zoneinfo/Europe/Tallinn /etc/localtime

echo "Install nessesary"
apt install -y zsh htop vim git tmux apt-transport-https zip unzip software-properties-common multitail

