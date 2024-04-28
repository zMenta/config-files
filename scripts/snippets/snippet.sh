#!/bin/bash
# Dependencies: xdotool, fd, rofi

dir_to_search=~/.scripts/snippets/snippets
if [ -d "$1" ]; then
    dir_to_search=$1
fi

search_result=$( ls $dir_to_search | rofi -dmenu -matching fuzzy -i -p "Select a snippet" ) 

if [ -n "$search_result" ]; then
    xdotool type "$(cat $dir_to_search/$search_result)"
fi
