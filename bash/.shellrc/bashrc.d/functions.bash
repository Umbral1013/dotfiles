#
# Bash functions.
#

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
