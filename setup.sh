#!/bin/bash

echo "start install $(date) ">>/tmp/oa.txt

cd /config || exit
echo "Hello. Thanks for trying Libation for Docker!" 
echo "First time setup... Downloading Libation v11.2.0 ...."  
wget -q --show-progress -O libation.deb https://github.com/rmcrackan/Libation/releases/download/v11.2.0/Libation.11.2.0-linux-chardonnay-amd64.deb



echo "Install Libation" # sudo is used to install to /usr/local
sudo apt install ./libation.deb
rm ./libation.deb

mkdir -p /config/Desktop
cp -f /usr/share/applications/Libation.desktop /config/Desktop/Libation.desktop

nohup libation >/dev/null 2>&1 &
sleep 10




