# User profile.d
if [ -d "$HOME/.config/profile.d" ]; then
    for file in "$HOME/.config/profile.d/"*.sh(N); do
        source "$file"
    done
fi

# Basic options
setopt autocd beep extendedglob globdots nomatch notify

# Prompt
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:git*' formats " %F{blue}%b%f %m%u%c %a "
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr ' %F{green}✚%f'
zstyle ':vcs_info:*' unstagedstr ' %F{red}●%f'

precmd() {
    vcs_info
    print -P '%B%~%b ${vcs_info_msg_0_}'
}

PROMPT='%(!.#.$) '

# History options
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt histignorespace appendhistory sharehistory

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
bindkey -M vicmd '/' history-incremental-search-backward

# Aliases
alias ll="ls -lah"
alias lsa="ls -ah"

# Plugin manager and plugins
# ! Should load before 'compinit'
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] \
    && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

# Completion
autoload -Uz compinit && compinit
