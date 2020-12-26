#!/bin/bash

sudo sh -c "echo Europe/Tallinn > /etc/timezone"
sudo rm -f /etc/localtime
sudo ln -sf /usr/share/zoneinfo/Europe/Tallinn /etc/localtime
