#
# .bashrc
#

# If not running interactively, do not do anything.
[[ $- != *i* ]] && return

# Source global definitions.
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment.
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# User specific aliases and functions.
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

shopt -s cdspell
shopt -s autocd
shopt -s histappend

# Read the manual of strftime to get more details on the format.
export HISTTIMEFORMAT="[%F %T] "
# Ignore duplicates and lines beggining with a space in history.
export HISTCONTROL=ignoreboth:erasedups
