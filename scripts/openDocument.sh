#!/bin/bash
# Dependencies: fd, zathura, rofi

dir_to_search=~/
if [ -d "$1" ]; then
    dir_to_search=$1
fi

search_result=$( fd . $dir_to_search -e pdf | rofi -dmenu -matching fuzzy -i -p "Open pdf" ) 

if [ -n "$search_result" ]; then
    # echo "'$search_result'"
    zathura "$search_result"
fi
