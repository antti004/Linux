#!/bin/bash

sudo cp kiosk.service /lib/systemd/system/kiosk.service

echo "Start kiosk service"
sudo systemctl enable kiosk.service
sudo systemctl start kiosk.service
