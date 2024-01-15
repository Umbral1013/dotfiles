#
# Bash aliases.
#

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
