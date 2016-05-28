# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'
alias emacs='emacsclient -t'

source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -Uz compinit
compinit

setopt completeinword
setopt HIST_IGNORE_SPACE

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

export WINEARCH=win32

export EDITOR="emacsclient -t"
export VISUAL="emacsclient -t"
export ALTERNATE_EDITOR=""

fortune -s | cowsay -w
