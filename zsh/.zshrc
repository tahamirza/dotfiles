# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

alias ls='ls --color=auto'
alias emacs='emacsclient -t'

source /usr/share/doc/pkgfile/command-not-found.zsh

autoload -Uz compinit promptinit
compinit
promptinit

setopt completeinword
setopt HIST_IGNORE_SPACE

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
prompt redhat

export WINEARCH=win32
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
alias steam-wine='WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe >/dev/null 2>&1 &'

export EDITOR="emacsclient -t"
export VISUAL="emacsclient -t"
export ALTERNATE_EDITOR=""

fortune -s | cowsay -w
