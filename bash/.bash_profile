# Bash Profile
# Author: Max Storr
# Date: 12.04.2019

# Shortcuts for config files
alias cf='cd ~/.dotfiles/'
alias vcf='vim ~/.dotfiles/config/.config/nvim/init.vim'
alias icf='vim ~/.dotfiles/config/.config/i3/config'
alias bcf='vim ~/.bash_profile'

# Activate Vim keybindings
set -o vi


# $PATH Additions
# Personal bash scripts
export PATH="$PATH:$HOME/.scripts/"
# Add vim-live-latex-preview binaries for live latex compiling
export PATH="$PATH:$HOME/.config/nvim/plugged/vim-live-latex-preview/bin"
