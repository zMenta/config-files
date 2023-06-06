#!/bin/bash

#--------------------------------------#
# This is simple install script to     #
#  install my desktop enviroment,      #
#  tested with basic xorg arch install #
#--------------------------------------#

install_list=(
	base-devel 
	wget # Download from the web
	unzip # Unzip files
	xclip # Clipboard manager, nvim yank support
	networkmanager 
	i3
	rofi
	polybar 

	#Additional tools
	rofi-calc
	thunar
	)


echo "------------------------------------"
echo "SCRIPT STARTING"
echo "sudo password is going to be asked"
echo "------------------------------------"
echo " - YAY is required"
echo "------------------------------------"


echo "-- Updating the sytem --"
# yay -Syu --noconfirm


echo "-- Installation Began --"
for value in "${install_list[@]}"; do
	eval yay -S "$value" --noconfirm
done


echo "-- Packages Configuration --"

echo " -> Network manager"
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

echo " -> Adding user $USER to video group"
echo sudo usermod -aG video "$USER"

