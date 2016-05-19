#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -Fh --color=auto'
# for colored man pages
man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
	LESS_TERMCAP_md=$'\E[01;38;5;74m' \
	LESS_TERMCAP_me=$'\E[0m' \
	LESS_TERMCAP_se=$'\E[0m' \
	LESS_TERMCAP_so=$'\E[38;5;246m' \
	LESS_TERMCAP_ue=$'\E[0m' \
	LESS_TERMCAP_us=$'\E[04;38;5;146m' \
	man "$@"
}

alias emacs='emacsclient -t'

# export PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] 
# \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'
export PS1="\[$(tput setaf 2)\]\u \[$(tput setaf 6)\]\W\n\[$(tput bold)\]\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"

export EDITOR="emacsclient -t"
export VISUAL="emacsclient -t"
export ALTERNATE_EDITOR=""

fortune -s | cowsay -w

# for command not found
source /usr/share/doc/pkgfile/command-not-found.bash
