# Exports
export TERM="st-256color"    
## Moving Android to xdg-base directories.
export ANDROID_SDK_HOME='$HOME/.config/android'
export ANDROID_AVD_HOME='$HOME/.local/share/android'
export ANDROID_EMULATOR_HOME='$HOME/.local/share/android'
export ABD_VENDOR_KEY='$HOME/.config/android'

# NNN Settings.
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_PLUG='n:nuke;w:wall;p:preview-tabbed'
export NNN_COLORS='1234'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_OPENER='/home/alexis/.config/nnn/plugins/nuke'
export NNN_BMS='d:$HOME/Documentos;D:$HOME/Descargas;i:$HOME/Imágenes'
export NNN_USE_EDITOR='1'
alias nnn="nnn -c -P p"

# Color output according to .xresources.
if [ "$TERM" = "st-direct" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi
