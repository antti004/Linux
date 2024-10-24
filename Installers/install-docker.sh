#!/bin/bash
curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

sudo usermod -aG docker ${USER}
su - ${USER}
sudo apt install docker-compose
