# export PATH="$HOME/.emacs.d/bin:$PATH" # Sad emacs noises
# alias emacs="emacsclient -c -a ''"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ########################################### #
export VISUAL=nvim
export EDITOR="$VISUAL"

export PATH="$HOME/godot:$PATH"
export LEDGER_FILE="$HOME/.ledger/.hledger.journal"

# Improved aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Custom aliases
alias gvim="nvim --listen ./godothost ."
alias gg="nvim -c Neogit" # Open Neogit

## Searching and opening files / directories
alias g='cd $(fd . --hidden --type d | fzf)' # Go to directory
alias p='cd $(fd . --hidden --type d | fzf) && nvim .' # Go to directoy and open nvim
alias pg='cd $(fd . --hidden --type d | fzf) && gvim' # Go to directoy and open gvim
alias f='nvim $(fd . --hidden --type f | fzf)' # open File with nvim
alias k='ps aux | fzf | awk "{print $2}" | xargs kill' # Kill a process
alias gp='cd $(fd . --hidden --type d | fzf) && nvim -c Neogit'  # Go to directory and open Neogit

