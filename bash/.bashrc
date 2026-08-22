# Modular RC
if [ -d "$HOME/.config/shellrc.d" ]; then
    for file in "$HOME/.config/shellrc.d/"*; do
        source "$file"
    done
fi

if [ -d /etc/shellrc.d ]; then
    for file in /etc/shellrc.d/*; do
        source "$file"
    done
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set -o vi

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

PS1="\[\033[01;34m\]\w\n\[\033[00m\]\$ "

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Programmable completion features 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
