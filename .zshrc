# Ctrl+wで直前の/までを削除する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# キーバインド
bindkey -e

# プロンプトの設定
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m]%(!.#.$) %{${reset_color}%}"
RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"
setopt transient_rprompt 

# 補完機能
setopt auto_cd
setopt auto_pushd
# 補完自動修正機能
#setopt correct
autoload -U compinit
compinit

# lsコマンドの補完候補にも色付き表示
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}
# kill の候補にも色付き表示
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end 
zle -N history-beginning-search-forward-end history-search-end 
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
setopt hist_ignore_dups
setopt share_history

# インクリメンタルサーチの設定
bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward
# カーソル位置から前方削除(Ctrl-u)
bindkey '^U' backward-kill-line
# Ctrl-h で単語ごとに削除
bindkey "^h" backward-kill-word
# 補完候補
setopt auto_list
setopt list_types
setopt list_packed
zstyle ':completion:*:processes' command 'ps x'
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
autoload -U predict-on
# 補完候補リストの日本語を正しく表示
setopt print_eight_bit

# エイリアス
alias ps="ps aux"
alias c=clear
alias vim="reattach-to-user-namespace vim"
