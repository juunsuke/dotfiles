#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias cp='cp -v'
alias mv='mv -v'
alias ls='ls --color -F'
alias l='ls -la'

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '
