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

export GS_FONTPATH="/usr/share/ghostscript/9.53.3/Resource/Font/"

# Better tab-autocomplete.
set show-all-if-ambiguous on
bind 'TAB:menu-complete'

# After !! view completion.
bind Space:magic-space

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/firefox

mkcd() { mkdir "$@"&&cd "$@";}

#
# Description:
#   cd into a directory and then list the files inside
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}

#
# Usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Some aliases were taken from:
# https://opensource.com/article/19/7/bash-aliases

alias lt='ls --human-readable --size -1 -S --classify' # List files by size.
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort" # List only mounted disks.
alias gh='history|grep' # Find a command on bash history.
alias left='ls -t -1' # Align listed files to the left.
alias count='find . -type f | wc -l' # Counts files and files within, but ignores files that are not inside a folder.
alias cpv='rsync -ah --info=progress2' # cp but with a progress bar.
alias tcn='mv --force -t ~/.local/share/Trash ' # rm alternative, which doesn't remove files, instead moves them to trash directory.
alias ve='python3 -m venv ./venv' # Create a virtual environment.
alias va='source ./venv/bin/activate' # Activate the virtual environment.

alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias nvimcfg="$EDITOR $HOME/.config/nvim/init.vim"
alias translate="gawk -f <(curl -Ls git.io/translate) -- -shell"
alias diff="diff --color=auto"
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias ip="ip --color=auto"
alias dmesg="dmesg --color=auto"
alias encrypt="gpg -c --no-symkey-cache --cipher-algo AES256"
