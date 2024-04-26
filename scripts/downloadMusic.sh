#!/bin/bash
# Downloads a youtube video audio
# Dependencies: rofi, yt-dlp

download_path=~/Sync/Music

music_url=$(rofi -dmenu -matching fuzzy -i -p "Download music to -> $download_path") 

if [ -n "$music_url" ]; then
    if [ ! -d $download_path ]; then
        mkdir -p $download_path
    fi
    yt-dlp -x -f bestaudio -P $download_path $music_url
fi
