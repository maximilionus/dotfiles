# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# User profile.d
if [ -d "$HOME/.config/profile.d" ]; then
    for file in "$HOME/.config/profile.d/"*.sh(N); do
        source "$file"
    done
fi

# History options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt histignorespace appendhistory sharehistory

# Basic options
setopt autocd beep extendedglob globdots nomatch notify

# Plugin manager and plugins
# - Should load before 'compinit'
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] \
    && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light romkatv/powerlevel10k

# Completion
autoload -Uz compinit && compinit

# - Move through lists with nav keys
zstyle ':completion:*' menu select

# - Enable colors for lists
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# - Case insensitive completion
zstyle ':completion:*' matcher-list '' \
    'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# VI mode
bindkey -v
bindkey "^?" backward-delete-char

# Keybindings
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey  "^[[H"   beginning-of-line
bindkey  "^[[F"   end-of-line
bindkey  "^[[3~"  delete-char

# Aliases
alias ll="ls -lah"
alias lsa="ls -ah"

# Load p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
