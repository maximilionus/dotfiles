# Match alacritty theme to gnome on startup
# Shell tests are conducted inside the target script, no additional checks
# required from here.
if [ ! -z "$ALACRITTY_TERM" ] && command -v alacritty-theme-match-gnome &> /dev/null; then
    alacritty-theme-match-gnome > /dev/null 2>&1
fi

