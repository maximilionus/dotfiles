# User profiled
if [ -d "$HOME/.config/profiled" ]; then
    for file in "$HOME/.config/profiled/"*.sh(N); do
        source "$file"
    done
fi
