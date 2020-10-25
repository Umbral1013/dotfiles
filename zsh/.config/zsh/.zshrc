#           _
# ___  ___ | |_    _ _   __
#|_ / (_-< | ' \  | '_| / _|
#/__| /__/ |_||_| |_|   \__|
#
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

####################
# USER-SET OPTIONS #
####################
#
#
# Autocompletion with arrow keys interface.
zstyle ':completion:*' menu select

# This line enables alias autocompletion.
setopt COMPLETE_ALIASES

# History search with arrow keys.
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "${key[Up]}"   ]] && bindkey -- "${key[Up]}"   up-line-or-beginning-search
[[ -n "${key[Down]}" ]] && bindkey -- "${key[Down]}" down-line-or-beginning-search
# Better history.
# Add the commands immediatly to the history file.
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
# Add timestamps to the history file.
setopt EXTENDED_HISTORY
# Ignore all duplicates.
setopt HIST_IGNORE_ALL_DUPS

# Auto change directory.
setopt AUTO_CD

# Loading the functions file.
source $ZDOTDIR/function.zsh

# Loading the exports file.
source $ZDOTDIR/export.zsh

# Loading the alias file.
source $ZDOTDIR/alias.zsh

# Loading the walters prompt theme.
autoload -Uz promptinit
promptinit
prompt walters
