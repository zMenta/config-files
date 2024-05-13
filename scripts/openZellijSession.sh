#!/bin/bash
# Open a project with a zellij session, if the project directory and zellij session already exists,
# attaches the already existing session.

# Dependencies: zellij, fzf, fd, neovim

session_name=$(zellij list-sessions | fzf --ansi --reverse | sed 's/\([^ ]*\).*/\1/')

if [[ $session_name == "" ]]; then
    echo "No session selected!"
    exit 1
fi

# Checks if a zellij session is not already open, if is not open. Attach the selected session
if [[ -z $ZELLIJ ]]; then
	zellij attach $session_name
	exit 0
fi

# Todo make session-manager swap sessions
echo "Already in a zellij session"
