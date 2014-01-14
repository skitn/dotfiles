PS1="[%T]%(!.#.$) " 
setopt transient_rprompt 

setopt auto_list
setopt auto_cd
setopt auto_pushd
setopt correct

#bindkey -v                        

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

# private setting
ZDOTDIR=$HOME
export ZDOTDIR
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local
