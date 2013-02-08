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

# history
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end 
zle -N history-beginning-search-forward-end history-search-end 
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt share_history

# alias
alias ll='ls -l'
alias vi=vim
alias tma='tmux attach'
alias tml='tmux ls'
alias c='clear'
