PS1="[%T]%(!.#.$) " 
setopt transient_rprompt 

export LANG=ja_JP.UTF-8
export EDITOR=vim
export PATH=/usr/local/bin:$PATH
export SHELL=/bin/zsh tmux

setopt auto_list
setopt auto_cd
setopt auto_pushd
setopt correct

bindkey -v                        

autoload -U compinit
compinit

# alias
alias ll='ls -l'
alias vi=vim
alias tma='tmux attach'
alias tml='tmux ls'
alias c='clear'
