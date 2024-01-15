#
# Bash prompt.
#

source $HOME/.local/bin/git-prompt.sh
source $HOME/.local/bin/git-completion.sh
PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
