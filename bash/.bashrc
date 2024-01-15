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

# Load all files from .shell/bashrc.d directory
if [ -d $HOME/.shellrc/bashrc.d ]; then
  for file in $HOME/.shellrc/bashrc.d/*.bash; do
    source $file
  done
fi

shopt -s cdspell
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

# Read the manual of strftime to get more details on the format.
export HISTTIMEFORMAT="[%F %T] "
# Ignore duplicates and lines beggining with a space in history.
export HISTCONTROL=ignoreboth:erasedups
