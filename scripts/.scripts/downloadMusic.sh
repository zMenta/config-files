#!/bin/bash
# Downloads a youtube video audio
# Dependencies: rofi, yt-dlp

download_path=~/Sync/Music

music_url=$(rofi -dmenu -matching fuzzy -i -p "Download music to -> $download_path") 

if [ -n "$music_url" ]; then
    if [ ! -d $download_path ]; then
        notify-send -u normal "$download_path not found" "Creating path..."
        if ! mkdir -p $download_path ; then
            notify-send -u critical "Error" "Unable to create directory $download_path"
        fi
    fi
    if yt-dlp -x -f bestaudio --embed-thumbnail --add-metadata -P $download_path $music_url ; then
        notify-send -u normal "Music Downloaded" "$music_url"
    else
        notify-send -u critical "Failed to download music" "$music_url"
    fi
fi
