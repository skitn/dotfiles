export LANG=ja_JP.UTF-8
export EDITOR=vim

ZDOTDIR=$HOME
export ZDOTDIR
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local


export PATH="/usr/local/bin:$PATH"
export PATH="$(~/homebrew/bin/brew --prefix)/bin:$PATH"
export PATH="$(~/homebrew/bin/brew --prefix coreutils)/libexec/gnubin:$PATH"

export SHELL=/bin/zsh tmux

# alias
alias ll='ls -l'
alias vi=vim
alias tma='tmux attach'
alias tml='tmux ls'
alias c='clear'
