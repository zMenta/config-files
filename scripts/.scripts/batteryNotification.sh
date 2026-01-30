#!/bin/bash

battery="BAT0"
lowLevel=25
highLevel=80
currentCharge=`cat /sys/class/power_supply/${battery}/capacity`
currentStatus=`cat /sys/class/power_supply/${battery}/status`
tempFile=~/.config/systemd/tempfiles/tempBatteryFile

notify() {
	if [ ! -e $tempFile ]; then
		notify-send --urgency "$1" "󰂃 Battery" "$2" --expire-time 15000
		touch $tempFile
	fi
}

if (( $currentCharge >= $highLevel )) && [ $currentStatus == "Charging" ]; then
	notify normal "Battery is above $highLevel%"
elif (( $currentCharge <= $lowLevel )) && [ $currentStatus == "Discharging" ]; then
	notify critical "Battery is below $lowLevel%"
elif [ -e $tempFile ]; then
	rm $tempFile
fi

