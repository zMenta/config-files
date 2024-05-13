#!/bin/bash
# Open a project with a zellij session, if the project directory and zellij session already exists,
# attaches the already existing session.

# Dependencies: zellij, fzf, fd, neovim

project_path=$(fd . ~/repos --hidden --type d | fzf --reverse)

if [[ $project_path == "" ]]; then
    echo "No project selected!"
    exit 1
fi

# tr changes the '/' character to '.' in the path name.
session_name=$(echo $project_path | tr '/' '.')

# Checks if a zellij session is not already open.
if [[ -z $ZELLIJ ]]; then
	cd $project_path
  
    # -c will make zellij to either create a new session or to attach into an existing one
	zellij --layout compact-open-project attach $session_name -c
	exit 0
fi

# Todo make session-manager swap sessions
echo "Already in a zellij session"
