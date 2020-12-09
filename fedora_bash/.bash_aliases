# All the aliases listed here were taken from https://opensource.com/article/19/7/bash-aliases

alias lt='ls --human-readable --size -1 -S --classify' # List files by size
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"  # List only mounted disks
alias gh='history|grep' # Find a command on bash history
alias left='ls -t -1'   # Align listed files to the left
alias count='find . -type f | wc -l'    # Counts files and files within, but ignores files that are not inside a folder
alias cpv='rsync -ah --info=progress2'  # cp but with a progress bar
alias tcn='mv --force -t ~/.local/share/Trash ' # rm alternative, which doesn't remove files, instead moves them to trash directory
# Create a Python virtual environment
alias ve='python3 -m venv ./venv'   # Create a virtual environment
alias va='source ./venv/bin/activate'   # Activate the virtual environment

# My own aliases
alias ~="cd ~"
alias ..="cd .."
alias ...="cd ../.."
alias nvimcfg="$EDITOR $HOME/.config/nvim/init.vim"
