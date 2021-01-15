# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# Source functions file
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# User specific environment and startup programs
export TERM="xterm-246color"

# Autostart x at login
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then exec startx; fi
