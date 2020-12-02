#!/bin/bash

echo "# Cleanup unused junk"
sudo apt remove --purge scratch2 minecraft-pi wolfram-engine sonic-pi dillo libreoffice libreoffice* squeak-vm squeak-plugins-scratch geany
sudo apt-get clean
sudo apt-get autoremove

echo "# Grabbing dependencies"
sudo apt-get install chromium-browser xorg lightdm x11-xserver-utils unclutter xdotool

echo "# Setting up auto login for ${USER}"
sudo sed -i 's/^#*autologin-user=.*/autologin-user='${USER}'/' /etc/lightdm/lightdm.conf

# Allows us to display our dashboard when we either "startx" or login to an X session
echo "# Setting up X session for ${USER}"
ln -fs ${PWD}/xsession ~/.xinitrc
ln -fs ${PWD}/xsession ~/.xsession

# This is where the list of URLs to cycle through goes
touch urls-0.txt
touch urls-1.txt
