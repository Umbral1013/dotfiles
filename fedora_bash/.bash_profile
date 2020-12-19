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
EDITOR="/usr/bin/nvim"
PYDICTION="$HOME/.local/share/nvim/site/pack/foo/start/pydiction/complete-dict"
PYTHON_VIMRC="$HOME/dotfiles/google_python_style.vim"
