#!/bin/bash
echo Download docker script
curl -fsSL get.docker.com -o ~/.installers/get-docker.sh
echo Downloaded

RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Error!"
  exit 1
fi

sh ~/.installers/get-docker.sh
sudo usermod -aG docker ${USER}
su - ${USER}
sudo apt install docker-compose

