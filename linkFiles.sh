#!/bin/bash

# This script must be run inside the repository root directory.

# This is a script to use stow and link the config files with the actual .config directory.
# Making configuration changes and organizing them easier.

# Removing files before stow, so stow can link the whole directory instead of only adopting if using the --adopt flag.
for file in dotfiles/* ; do
	file=${file#*/}
	if [ -d ~/.config/$file ]; then
		rm -r ~/.config/$file
	fi
done

if [ -d ~/.scripts ]; then
	rm -r ~/.scripts
fi

stow --restow dotfiles -t ~/.config
stow --restow scripts -t ~/
stow --restow bashrc -t ~/ --adopt
