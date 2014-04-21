export LANG=ja_JP.UTF-8
export EDITOR=vim

ZDOTDIR=$HOME
export ZDOTDIR
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

if which brew &> /dev/null; then
  export PATH="$(brew --prefix)/bin:/usr/local/bin:$PATH"
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
else
  export PATH="/usr/local/bin:$PATH"
fi

export SHELL=/bin/zsh tmux

# alias
alias ll='ls -l'
alias vi=vim
alias tma='tmux attach'
alias tml='tmux ls'
alias c='clear'
