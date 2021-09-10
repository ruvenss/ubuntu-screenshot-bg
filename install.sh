#!/bin/sh
sudo apt install -y scrot
sudo apt install -y curl
sudo apt install -y imagemagick
sudo apt install -y webp
sudo apt autoremove -y
chmod +x screenshot.sh
(crontab -l && echo "* *  * * *  ~/ubuntu-screenshot-bg/./screenshot.sh") | crontab -
