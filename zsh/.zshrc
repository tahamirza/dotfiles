# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# autoloads and inits
autoload -Uz compinit promptinit bashcompinit
compinit
promptinit
bashcompinit

# command not found
source /usr/share/doc/pkgfile/command-not-found.zsh

# aliases
alias ls='ls --color=auto'
alias t='todo.sh'

# completion
setopt completeinword
setopt HIST_IGNORE_SPACE
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# the prompt
powerline-daemon -q
. /usr/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh

# wine
export WINEARCH=win32
export WINEDLLOVERRIDES="winemenubuilder.exe=d"
alias steam-wine='WINEDEBUG=-all wine ~/.wine/drive_c/Program\ Files/Steam/Steam.exe >/dev/null 2>&1 &'

# editors
export EDITOR="vim"
export VISUAL="vim"

# fun
fortune -s | cowsay -w

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
