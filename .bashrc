#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias cp='cp -v'
alias mv='mv -v'
alias ls='ls --color -F'
alias l='ls -la'
alias vi=nvim

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '

export FZF_DEFAULT_COMMAND='fd --type f'

export PATH="/home/juun/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/bin:/home/juun/.zig/default:$PATH"


