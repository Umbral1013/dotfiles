# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle :compinstall filename '$HOME/.config/zsh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/history/.histfile
HISTSIZE=100000000
SAVEHIST=100000000
bindkey -e
# End of lines configured by zsh-newuser-install

# User-set options
    ## Autocompletion with arrow keys interface.
      zstyle ':completion:*' menu select
        ### This line enables alias autocompletion.
          setopt COMPLETE_ALIASES
    ## History search with arrow keys.
      autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search

      [[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
      [[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
    ## Better history.
        ### Add the commands immediatly to the history file.
          setopt INC_APPEND_HISTORY
          export HISTTIMEFORMAT="[%F %T] "
        ### Add timestamps to the history file.
          setopt EXTENDED_HISTORY
        ### Ignore all duplicates.
          setopt HIST_IGNORE_ALL_DUPS
    ## Load the prompt
      fpath+=$HOME/.config/zsh/plugins/pure
      autoload -Uz promptinit ; promptinit
        ### Load redhat theme
          prompt pure 

# Functions
   ## Extraction function. Usage: 'ex <file-name>'
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

    ## Man in colors.
      man() {
          LESS_TERMCAP_md=$'\e[01;31m' \
          LESS_TERMCAP_me=$'\e[0m' \
          LESS_TERMCAP_se=$'\e[0m' \
          LESS_TERMCAP_so=$'\e[01;44;33m' \
          LESS_TERMCAP_ue=$'\e[0m' \
          LESS_TERMCAP_us=$'\e[01;32m' \
          command man "$@"
      }

# Exports
    export VISUAL=vim
    export EDITOR="$VISUAL"
    export TERM="st-256color"    
        ## Moving Android to xdg-base directories.
          export ANDROID_SDK_HOME='$HOME/.config/android'
          export ANDROID_AVD_HOME='$HOME/.local/share/android'
          export ANDROID_EMULATOR_HOME='$HOME/.local/share/android'
          export ABD_VENDOR_KEY='$HOME/.config/android'

# NNN Settings
    export NNN_FIFO='/tmp/nnn.fifo'
    export NNN_PLUG='p:preview_tabbed;n:nuke;w:wall'
    export NNN_COLORS='1234'
    export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
    export NNN_OPENER='/home/alexis/.config/nnn/plugins/nuke'
    alias nnn="nnn -c"

# Aliases
    alias zshconfig="$EDITOR $ZDOTDIR/.zshrc"
    alias notes="$EDITOR $HOME/Documentos/sync/textos1/notas/notas.md"
    alias rm="rm -I"
    alias mv="mv -i"
    alias cp="cp -i"
    alias ls="ls --color=auto -hal"
    alias grep="grep --color=auto"
    alias ckube="$HOME/Documentos/scripts_y_código/ckube/ckube"
    alias fetch="$HOME/Documentos/scripts_y_código/fet.sh/fet.sh"
    alias more="less -R"
    alias df="df -h"
    alias ping='ping -c 5'
    alias dmesg='dmesg -HL'
    alias sc='source $ZDOTDIR/.zshrc'
    alias ~='cd ~'
    alias ..='cd ..'
    ## Git aliases
      alias ga='git add'
      alias gs='git status'
      alias gc='git commit -m'
      alias gpush='git push'
      alias gpull='git pull'

# Plugins.
    ## Spaceship promopt.
#      source $HOME/.config/zsh/plugins/spaceship-prompt/spaceship.zsh
    ## Zsh suggestions.
      source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ## Zsh syntax highlighting.
      source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

