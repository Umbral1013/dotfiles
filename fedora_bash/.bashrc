# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# Source aliases file
if [ -e $HOME/.bash_aliases ]; then     
    source $HOME/.bash_aliases
fi

# Source functions file
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi
# Define default editor
EDITOR="/usr/bin/nvim"

# Better tab-autocomplete
set show-all-if-ambiguous on
bind 'TAB:menu-complete'

# Custom prompt
green="\[$(tput setaf 2)\]"
pink="\[$(tput setaf 9)\]"
bold="\[$(tput bold)\]"
reset="\[$(tput sgr0)\]"
PS1="${pink}${bold}\u${reset} ▶ \W ${green}→${reset} "
