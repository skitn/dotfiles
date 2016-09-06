dotfiles
====

事前準備
---------------------------------------
tmux  
zsh  
vim（バージョン：7.3.885以上で、if_luaが使えること） 
coreutils

インストール方法
---------------------------------------
```
$ git clone https://github.com/skitn/dotfiles.git  
$ cd dotfiles  
$ git submodule update -i  
$ ln -s `pwd`/{.zshenv,.zshrc,.tmux.conf,.vim,.vimrc,.vimrc.plugins,.irbrc} ~/
$ export TERM=xterm-256color 
```

And do `:PlugInstall` in vim
