export LANG=ja_JP.UTF-8
export EDITOR=vim

ZDOTDIR=$HOME
export ZDOTDIR
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local


export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
if which brew &> /dev/null; then
  export PATH="$(brew --prefix)/bin:$PATH"
  export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
  export GOPATH=$HOME/dev
  export PATH=$PATH:$GOPATH/bin
fi

# alias
alias ll='ls -l'
alias vi=vim
alias c='clear'
