#!/bin/bash
# Dependencies: fd, zathura, rofi

dir_to_search=~/Documents/
if [ -d "$1" ]; then
    dir_to_search=$1
fi

# search_result=$( fd . $dir_to_search -e pdf | rofi -dmenu -matching fuzzy -i -p "Open pdf" ) 

search_result=$(fd . "$dir_to_search" -e pdf -a | while read -r file; do
    echo -en "${file}\0icon\x1fthumbnail://${file}\n"
	done | rofi -dmenu -matching fuzzy -i -p "Open pdf" -show-icons -config ~/.config/rofi/bigicon_list_preview.rasi)

if [ -n "$search_result" ]; then
    zathura "$search_result"
fi
