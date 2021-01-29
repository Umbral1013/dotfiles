# .bash_functions

# "mkcd" to mkdir and then cd to the result {{{
mkcd() { mkdir "$@"&&cd "$@";}
# }}}

# cl - cd and ls at the same time {{{
#
# Description:
#   cd into a directory and then list the files inside
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
# }}}

# ex - Archive Extractor {{{
#
# Usage: ex <file>
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
# }}}

# Man in colors {{{
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
# }}}

# Feed reader {{{
# From:
# https://bbs.archlinux.org/viewtopic.php?pid=1145058#p1145058
if [ ! -n "$FEED_BOOKMARKS" ]; then export FEED_BOOKMARKS=$HOME/.feed_bookmarks; fi
if [ ! -d "$FEED_BOOKMARKS" ]; then mkdir -p $FEED_BOOKMARKS; fi

feed() {
	if [ ! -d $FEED_BOOKMARKS ]; then mkdir $FEED_BOOKMARKS; fi

	if [ ! -n "$1" ]; then
		echo -e "\\n \\e[04mUsage\\e[00m\\n\\n   \\e[01;37m\$ feed \\e[01;31m<url>\\e[00m \\e[01;31m<new bookmark?>\\e[00m\\n\\n \\e[04mSee also\\e[00m\\n\\n   \\e[01;37m\$ deef\\e[00m\\n"
		return 1;
	fi

	local rss_source="$(curl --silent $1 | sed -e ':a;N;$!ba;s/\n/ /g')";

	if [ ! -n "$rss_source" ]; then
		echo "The feed is empty";
		return 1;
	fi

	# THE RSS PARSER
	# The characters "£, §" are used as metacharacters. They should not be encountered in a feed...
	echo -e "$(echo $rss_source | \
		sed -e 's/&amp;/\&/g
		s/&lt;\|&#60;/</g
		s/&gt;\|&#62;/>/g
		s/<\/a>/£/g
		s/href\=\"/§/g
		s/<title>/\\n\\n\\n   :: \\e[01;31m/g; s/<\/title>/\\e[00m ::\\n/g
		s/<link>/ [ \\e[01;36m/g; s/<\/link>/\\e[00m ]/g
		s/<description>/\\n\\n\\e[00;37m/g; s/<\/description>/\\e[00m\\n\\n/g
		s/<p\( [^>]*\)\?>\|<br\s*\/\?>/\n/g
		s/<b\( [^>]*\)\?>\|<strong\( [^>]*\)\?>/\\e[01;30m/g; s/<\/b>\|<\/strong>/\\e[00;37m/g
		s/<i\( [^>]*\)\?>\|<em\( [^>]*\)\?>/\\e[41;37m/g; s/<\/i>\|<\/em>/\\e[00;37m/g
		s/<u\( [^>]*\)\?>/\\e[4;37m/g; s/<\/u>/\\e[00;37m/g
		s/<code\( [^>]*\)\?>/\\e[00m/g; s/<\/code>/\\e[00;37m/g
		s/<a[^§]*§\([^\"]*\)\"[^>]*>\([^£]*\)[^£]*£/\\e[01;31m\2\\e[00;37m \\e[01;34m[\\e[00;37m \\e[04m\1\\e[00;37m\\e[01;34m ]\\e[00;37m/g
		s/<li\( [^>]*\)\?>/\n \\e[01;34m*\\e[00;37m /g
		s/<!\[CDATA\[\|\]\]>//g
		s/\|>\s*<//g
		s/ *<[^>]\+> */ /g
		s/[<>£§]//g')\n\n";
	# END OF THE RSS PARSER

	if [ -n "$2" ]; then
		echo "$1" > $FEED_BOOKMARKS/$2
		echo -e "\\n\\t\\e[01;37m==> \\e[01;31mBookmark saved as \\e[01;36m\\e[04m$2\\e[00m\\e[01;37m <==\\e[00m\\n"
	fi
}

deef() {
	if test -n "$1"; then
		if [ ! -r "$FEED_BOOKMARKS/$1" ]; then
			echo -e "\\n \\e[01;31mBookmark \\e[01;36m\\e[04m$1\\e[00m\\e[01;31m not found.\\e[00m\\n\\n \\e[04mType:\\e[00m\\n\\n   \\e[01;37m\$ deef\\e[00m (without arguments)\\n\\n to get the complete list of all currently saved bookmarks.\\n";
			return 1;
		fi
		local url="$(cat $FEED_BOOKMARKS/$1)";
		if [ ! -n "$url" ]; then
			echo "The bookmark is empty";
			return 1;
		fi
		echo -e "\\n\\t\\e[01;37m==> \\e[01;31m$url\\e[01;37m <==\\e[00m"
		feed "$url";
	else
		echo -e "\\n \\e[04mUsage\\e[00m\\n\\n   \\e[01;37m\$ deef \\e[01;31m<bookmark>\\e[00m\\n\\n \\e[04mCurrently saved bookmarks\\e[00m\\n";
		for i in $(find $FEED_BOOKMARKS -maxdepth 1 -type f);
			do echo -e "   \\e[01;36m\\e[04m$(basename $i)\\e[00m";
		done;
		echo -e "\\n \\e[04mSee also\\e[00m\\n\\n   \\e[01;37m\$ feed\\e[00m\\n";
	fi;
}
# }}}

# Less in colors {{{
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin blink
export LESS_TERMCAP_md=$'\E[1;36m'     # begin bold
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# and so on
# }}}
