# Modular profile
if [ -d "$HOME/.config/profile.d" ]; then
    for file in "$HOME/.config/profile.d/"*.sh; do
        source "$file"
    done
fi
