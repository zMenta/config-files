# export PATH="$HOME/.emacs.d/bin:$PATH" # Sad emacs noises
# alias emacs="emacsclient -c -a ''"

# ########################################### #
export PATH="$HOME/godot:$PATH"

export LEDGER_FILE="$HOME/.ledger/.hledger.journal"

alias gvim="nvim --listen ./godothost ."

# fd + fzf commands
alias g='cd $(fd . --hidden --type d | fzf)' # Go to directory
alias p='cd $(fd . --hidden --type d | fzf) && nvim .' # Go to directoy and open nvim
alias pg='cd $(fd . --hidden --type d | fzf) && gvim' # Go to directoy and open gvim
alias f='nvim $(fd . --hidden --type f | fzf)' # open File with nvim
alias k='ps aux | fzf | awk "{print $2}" | xargs kill' # Kill a process
