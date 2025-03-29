# export PATH="$HOME/.emacs.d/bin:$PATH" # Sad emacs noises
# alias emacs="emacsclient -c -a ''"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If shell is interactively, source ble.sh
# using the installed path from the AUR blesh package.
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

# Enables vim motions
if [[ $- == *i* ]]; then
  set -o vi
fi

# ########################################### #
export VISUAL=nvim
export EDITOR="$VISUAL"
export MANPAGER='nvim +Man!'

export PATH="$HOME/godot:$PATH"
export LEDGER_FILE="$HOME/.ledger/.hledger.journal"

#####################
# Yazi file manager #
#####################
# Yazi wrapper -> enables to change the current working directory when exiting Yazi
function openYazi() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
alias yy=openYazi

######################
# "Improved" aliases #
######################
alias ls='ls -lh --color=auto'
alias grep='grep --color=auto'
alias n="nvim"
alias hl="hledger"


##################
# Custom aliases #
##################
alias gvim="nvim --listen ./.godothost"

## Neogit 
alias gg="nvim -c Neogit" # Open Neogit
alias gp='cd $(fd . ~/repos --hidden --type d | fzf --reverse) && nvim -c Neogit'  # Go to directory and open Neogit

## Oil Explorer
alias e="nvim -c Oil" # Open file explorer

## Searching and opening files / directories
alias g='cd $(fd . ~/ --hidden --type d | fzf --reverse)' # Go to directory
alias p='~/.scripts/./openProjectZellij.sh'
alias pp='cd $(fd . ~/repos --hidden --type d | fzf --reverse ) && nvim .' # (Project) Go to projects repos directory and open nvim
alias zs="~/.scripts/./openZellijSession.sh"
alias pg='cd $(fd . ~/ --hidden --type d | fzf --reverse) && nvim .' # (Project Global) Go to home directoy and open nvim
alias pgodot='cd $(fd . ~/ --hidden --type d | fzf --reverse) && gvim' # Go to directoy and open gvim
alias f='nvim $(fd . ~/ --hidden --type f | fzf --reverse --preview="bat {1}")' # open File with nvim
alias k='ps aux | fzf --reverse | awk "{print $2}" | xargs kill' # Kill a process

## Development
alias runcpp='function compile_and_run() { g++ -o output "$1" && ./output; }; compile_and_run' # Compiles the project to 'output', then runs it.

################
# Tools Setups #
################

# Initialize zoxide
eval "$(zoxide init bash)"
# Ble.sh, more information can be found here: https://github.com/akinomyoga/ble.sh?tab=readme-ov-file#13-set-up-bashrc
[[ ! ${BLE_VERSION-} ]] || ble-attach
