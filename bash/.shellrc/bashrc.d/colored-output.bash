#
# Colored output.
#

# Via https://wiki.archlinux.org/title/Color_output_in_console#Applications
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'

alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep -n --color=auto'
alias ip='ip --color=auto'
alias dmesg='dmesg --color=auto'
