# Bash Profile
# Author: Max Storr

# Environment variables
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache
export XDG_RUNTIME_DIR=/run/user/$UID

# Aliases
## Config shortcuts
alias e='nvim'
alias vim='nvim'
alias cf='cd ~/.dotfiles/'
alias ccf='e ~/.dotfiles/compton/.config/compton.conf'
alias vcf='e ~/.dotfiles/nvim/.config/nvim/init.vim'
alias icf='e ~/.dotfiles/i3/.config/i3/config'
alias bcf='e ~/.dotfiles/bash/.profile'
alias xcf='e ~/.dotfiles/Xresources/.Xresources'
alias rcf='e ~/.dotfiles/ranger/.config/ranger/rc.conf'
alias tcf='e ~/.tmux.conf'

## Personal script directory
alias sc='cd ~/.dotfiles/bin/bin/scripts'
alias cx='chmod +x'

## Command aliases
function mydir() { mkdir -p "$1" && cd "$1"; }

function c() {
    if [ $# -eq 0 ] ; then
        clear
    elif [ -d "$1" ] ; then
        cd "$1"
    elif [ -f "$1" ] ; then
        cat "$1"
    fi
}


# $PATH Additions
## Personal bash scripts
export PATH="$PATH:$HOME/bin/scripts"
export PATH="$PATH:$HOME/bin/colour_scripts/"
## Add vim-live-latex-preview binaries for live latex compiling
export PATH="$PATH:$HOME/.config/nvim/plugged/vim-live-latex-preview/bin/"
export PATH="$PATH:/opt/mssql-tools18/bin"


# Activate Vim keybindings
set -o vi


# Pywal settings
## Import colorscheme from 'wal' asynchronously
## (cat ~/.cache/wal/sequences &)

