PS1="[%T]%(!.#.$) "
RPROMPT=$GREEN'[%~]'$WHITE
setopt transient_rprompt 

setopt auto_list
setopt auto_cd
setopt auto_pushd
setopt correct

# bindkey -v                        
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

zstyle ':completion:*:processes' command 'ps x'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload -U predict-on

# private setting
ZDOTDIR=$HOME
export ZDOTDIR
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local
