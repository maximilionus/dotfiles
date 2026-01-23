# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

set -o vi

# Extended pattern matching
shopt -s globstar

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will match all
# files and zero or more directories and subdirectories.
#shopt -s globstar

PS1="\[\033[01;34m\]\w\n\[\033[00m\]\$ "

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -d "$HOME/.config/profiled" ]; then
    for file in "$HOME/.config/profiled/"*.sh; do
        source "$file"
    done
fi

# Programmable completion features 
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
