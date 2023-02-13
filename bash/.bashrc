#
# ~/.bashrc
#

# If not running interactively, do not do anything.
[[ $- != *i* ]] && return

# Set PATH so it includes user's private bin if it exists.
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

shopt -s cdspell
shopt -s autocd
shopt -s histappend

source /usr/share/git/completion/git-prompt.sh
source /usr/share/git/completion/git-completion.bash
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

# Show status of current git repository compared to upstream.
export GIT_PS1_SHOWUPSTREAM=auto

# Ignore duplicates and lines beggining with a space in history.
export HISTCONTROL=ignoreboth:erasedups

export PAGER=/usr/bin/less
export EDITOR=/usr/bin/vi
export VISUAL=/usr/bin/vim
export BROWSER=/usr/bin/firefox
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Colored output.
# Via https://wiki.archlinux.org/title/Color_output_in_console#Applications
export LESSOPEN="| /usr/bin/source-highlight-esc.sh %s"
export LESS='-R --use-color -Dd+r$Du+b'
export MANPAGER='less -R --use-color -Dd+r -Du+b'
alias ls='ls --color=auto'
alias diff='diff --color=auto'
alias grep='grep -n --color=auto'
alias ip='ip --color=auto'
alias dmesg='dmesg --color=auto'

alias gh='history | grep'
alias encrypt='gpg -c --no-symkey-cache --cipher-algo AES256'
alias ll='ls -lah'
alias rm='rm -i'
alias mv='mv -vu'
alias vimrc="$EDITOR $HOME/.vimrc"
alias gm='env LD_BIND_NOW=1 gamemoderun'

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

# Optimize PDF files for screens.
# Via https://gist.github.com/ahmed-musallam/27de7d7c5ac68ecbd1ed65b6b48416f9
pdfcompress ()
{
   gs -q -dNOPAUSE -dBATCH -dSAFER -sDEVICE=pdfwrite -dCompatibilityLevel=1.3 -dPDFSETTINGS=/screen -dEmbedAllFonts=true -dSubsetFonts=true -dColorImageDownsampleType=/Bicubic -dColorImageResolution=144 -dGrayImageDownsampleType=/Bicubic -dGrayImageResolution=144 -dMonoImageDownsampleType=/Bicubic -dMonoImageResolution=144 -sOutputFile=$1.compressed.pdf $1;
}
