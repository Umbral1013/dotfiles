# FUNCTIONS
# Extraction function. Usage: 'ex <file-name>'
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

# Man in colors
      man() {
          LESS_TERMCAP_md=$'\e[01;31m' \
          LESS_TERMCAP_me=$'\e[0m' \
          LESS_TERMCAP_se=$'\e[0m' \
          LESS_TERMCAP_so=$'\e[01;44;33m' \
          LESS_TERMCAP_ue=$'\e[0m' \
          LESS_TERMCAP_us=$'\e[01;32m' \
          command man "$@"
      }
