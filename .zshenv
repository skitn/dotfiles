export LANG=ja_JP.UTF-8
export EDITOR=vim

if which brew &> /dev/null; then
  export PATH="$(brew --prefix)/bin:/usr/local/bin:$PATH"
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
