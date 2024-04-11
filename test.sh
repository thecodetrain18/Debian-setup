#!/usr/bin/env bash

#update the system
sudo apt update
sudo apt upgrade

#tools
sudo apt install -y htop ranger git duf micro
sudo apt install -y build-essential

#xorg
sudo apt install -y xserver-xorg-core xserver-xorg-video-intel xinit xinput x11-xserver-utils
sudo apt install -y arandr


#others
sudo apt install -y qbittorrent feh mpv pcmanfm firefox-esr alacritty unzip evince tty-clock

#networking
sudo apt install -y iwd network-manager
#sudo systemctl --now disable wpa_supplicant
#sudo micro /etc/iwd/main.conf
#EnableNetworkConfiguration=true
#sudo systemctl --now enable iwd


#seting up pipewire
sudo apt install -y pipewire pipewire-audio wireplumber
#systemctl --user --now enable pipewire{,-pulse}.{socket,service}
systemctl --user --now enable wireplumber.service


#set console font
#sudo dpkg-reconfigure console-setup

#suckless
sudo apt install -y libx11-dev libxinerama-dev libxft-dev 
mkdir ~/.config/suckless
cd ~/.config/suckless
tools=( "dwm" "st" "dmenu" )
for tool in ${tools[@]}
do 
	git clone git://git.suckless.org/$tool
	cd ~/.config/suckless/$tool;make;sudo make clean install;cd ..
done

sudo apt autoremove

