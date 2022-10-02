#
# ~/.bashrc
#

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

alias ls="ls --color=auto"

source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

shopt -s cdspell
shopt -s autocd
shopt -s histappend

export EDITOR="/usr/bin/vim"
export BROWSER="/usr/bin/firefox"
# Ignore duplicates and lines beggining with a space in history.
export HISTCONTROL=ignoreboth:erasedups

# Show status of current git repository compared to upstream.
export GIT_PS1_SHOWUPSTREAM=auto

# Colored output for some applications.
# Via https://wiki.archlinux.org/title/Color_output_in_console#Applications
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'
alias diff="diff --color=auto"
alias grep="grep -n --color=auto"
alias ip="ip --color=auto"
alias dmesg="dmesg --color=auto"

alias gh="history | grep"
alias encrypt="gpg -c --no-symkey-cache --cipher-algo AES256"
alias ll="ls -lah"
alias rm="rm -i"
alias vimrc="$EDITOR $HOME/.vimrc"

# mkdir && cd.
mkcd() { mkdir "$@"&&cd "$@";}

# cl
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

# ex
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
