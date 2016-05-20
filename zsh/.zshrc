# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'

source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -Uz compinit
compinit

setopt completeinword
setopt HIST_IGNORE_SPACE

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

fortune -s | cowsay -w
