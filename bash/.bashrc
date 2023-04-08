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

source $HOME/.local/bin/git-prompt.sh
source $HOME/.local/bin/git-completion.sh
PS1='[\u@\h:\W$(__git_ps1 " (%s)")]\$ '

# Show hints about the current dirty state in color.
export GIT_PS1_SHOWCOLORHINTS=true
# Show status of current git repository compared to upstream.
export GIT_PS1_SHOWUPSTREAM=auto

# Read the manual of strftime to get more details on the format.
export HISTTIMEFORMAT="[%F %T] "
# Ignore duplicates and lines beggining with a space in history.
export HISTCONTROL=ignoreboth:erasedups

# Colored output.
# Via https://wiki.archlinux.org/title/Color_output_in_console#Applications
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep -n --color=auto'
alias ip='ip --color=auto'
alias dmesg='dmesg --color=auto'
