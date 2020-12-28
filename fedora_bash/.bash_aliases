# .bash_aliases
# Some aliases were taken from:
# https://opensource.com/article/19/7/bash-aliases


# ALIASES TAKEN FROM THE WEBSITE -------- {{{
# List files by size
alias lt='ls --human-readable --size -1 -S --classify' 

# List only mounted disks
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"  

# Find a command on bash history
alias gh='history|grep' 

# Align listed files to the left
alias left='ls -t -1'   

# Counts files and files within, but ignores files that are not inside a folder
alias count='find . -type f | wc -l'    

# cp but with a progress bar
alias cpv='rsync -ah --info=progress2'  

# rm alternative, which doesn't remove files, instead moves them to trash directory
alias tcn='mv --force -t ~/.local/share/Trash ' 

# Create a virtual environment
alias ve='python3 -m venv ./venv'   

# Activate the virtual environment
alias va='source ./venv/bin/activate'   
# }}}


# MY OWN ALIASES -------- {{{
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias nvimcfg="$EDITOR $HOME/.config/nvim/init.vim"
alias tr="gawk -f <(curl -Ls git.io/translate) -- -shell"
# }}}
