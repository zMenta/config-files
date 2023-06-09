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
	ly # TUI Login screen

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
yay -Syu --noconfirm

echo "-- Installation Began --"
for value in "${install_list[@]}"; do
	eval yay -S "$value" --noconfirm
done

echo "-- Installing FiraMonoNerdFont --"
echo " -> /usr/share/fonts/FiraMonoNerdFont"
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraMono.zip -P "$PWD"
sudo mkdir /usr/share/fonts/FiraMonoNerdFont
sudo unzip FiraMono.zip -d /usr/share/fonts/FiraMonoNerdFont

echo "-- Packages Configuration --"
echo " -> Network manager"
sudo systemctl start NetworkManager
sudo systemctl enable NetworkManager

echo " -> ly - Login Manager"
sudo systemctl enable ly.service

# Adding the user to video group, so in polybar can change the backlight levels.
# check https://wiki.archlinux.org/title/Backlight#ACPI for more info.
rule='ACTION=="add", SUBSYSTEM=="backlight", RUN+="/bin/chgrp video $sys$devpath/brightness", RUN+="/bin/chmod g+w $sys$devpath/brightness"'
rule_path="/etc/udev/rules.d/backlight.rules"
echo " -> Adding user $USER to video group"
sudo usermod -aG video "$USER"
echo " -> Adding backlight rule to $rule_path"
if [[ ! -f "$rule_path" ]]; then
	touch rule_path
	echo " -> Rule file created"
fi

if ! grep -Fxq "$rule" "$rule_path"; then
	echo "$rule" | sudo tee -a "$rule_path"
	echo " -> Rule written"
else
	echo " -> [W] Backlight rule already exist in $rule_path"
fi


echo "------------------------------------"
echo "SCRIPT FINISHED"
echo "reboot is recommended"
echo "------------------------------------"

