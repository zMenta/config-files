#!/bin/bash
# This is script was created to open Alacritty and maintain some of functionalities of my .bashrc file since I'm not able to open Alacritty command option with loading some of my configs and aliases.
# The openYazi script can be found on my .bashrc file.

alacritty -e bash -c '
    export EDITOR=nvim

    function openYazi() {
        local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
            cd -- "$cwd"
        fi
        rm -f -- "$tmp"
    } 

    # After finishing running yazi, spawn bash so the terminal dont closes
    openYazi; exec bash
'
