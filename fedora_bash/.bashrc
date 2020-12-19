# .bashrc

# DEFINED BY DEFUALT -------- {{{
#
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

# }}}


# USER DEFINED -------- {{{

# Better tab-autocomplete
set show-all-if-ambiguous on
bind 'TAB:menu-complete'

# Custom prompt
PS1="\u @ \[\e[4m\]\W\[\e[0m\] → "

# Source bash functions
if [ -e $HOME/.bash_functions ]; then     
    source $HOME/.bash_functions
fi

# }}}
