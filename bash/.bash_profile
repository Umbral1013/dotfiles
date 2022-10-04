#
# ~/.bash_profile
#

# I do not know what this does, but it seems important.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Start X at login.
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx >/dev/null 2>&1
fi
