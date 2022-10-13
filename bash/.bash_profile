#
# ~/.bash_profile
#

# I do not know what this does, but it seems important.
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart X at login.
# Via https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx >/dev/null 2>&1
fi
