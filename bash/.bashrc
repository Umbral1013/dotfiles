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

shopt -s cdspell
shopt -s autocd
shopt -s histappend
shopt -s checkwinsize

# Read the manual of strftime to get more details on the format.
export HISTTIMEFORMAT="[%F %T] "
# Ignore duplicates and lines beggining with a space in history.
export HISTCONTROL=ignoreboth:erasedups

source $HOME/.local/bin/git-prompt.sh
source $HOME/.local/bin/git-completion.sh
PS1='\u@\h:\W$(__git_ps1 " (%s)")\$ '

# Show hints about the current dirty state in color.
export GIT_PS1_SHOWCOLORHINTS=true
# Show status of current git repository compared to upstream.
export GIT_PS1_SHOWUPSTREAM=auto

mkcd() { mkdir "$@"&&cd "$@";}  # mkdir && cd at the same time.

# cd into a directory and then list the files inside.
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

# Extract files with a different program depending on the filetype.
ex ()
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1   ;;
            *.tar.gz)    tar xzf $1   ;;
            *.bz2)       bunzip2 $1   ;;
            *.rar)       unrar x $1   ;;
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
    gs \
        -q \
        -dNOPAUSE \
        -dBATCH \
        -dSAFER \
        -sDEVICE=pdfwrite \
        -dCompatibilityLevel=1.3 \
        -dPDFSETTINGS=/screen \
        -dEmbedAllFonts=true \
        -dSubsetFonts=true \
        -dColorImageDownsampleType=/Bicubic \
        -dColorImageResolution=144 \
        -dGrayImageDownsampleType=/Bicubic \
        -dGrayImageResolution=144 \
        -dMonoImageDownsampleType=/Bicubic \
        -dMonoImageResolution=144 \
        -sOutputFile=$1.compressed.pdf \
        $1;
    }

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

export PAGER=/usr/bin/less
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export BROWSER=/usr/bin/firefox
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Colored output.
# Via https://wiki.archlinux.org/title/Color_output_in_console#Applications
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
alias vimrc="$EDITOR $HOME/.vim/vimrc"
alias game='env LD_BIND_NOW=1 gamemoderun'
alias e="$VISUAL"
alias cls='clear'

# git aliases.
alias gadd='git add'
alias gdiff='git diff'
alias glog='git log --pretty'
alias gcommit='git commit -am'
alias gpush='git push'
alias gstatus='git status'
alias gpull='git pull'
alias gclone='git clone'
