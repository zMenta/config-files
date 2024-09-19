#!/bin/bash

# This script must be run inside the repository root directory.

# This is a script to use stow and link the config files with the actual .config directory.
# Making configuration changes and organizing them easier.

if [ ! -d ~/.scripts ]; then
    mkdir ~/.scripts
fi

stow --restow dotfiles -t ~/.config --adopt
stow --restow scripts -t ~/.scripts --adopt
stow --restow bashrc -t ~/ --adopt
