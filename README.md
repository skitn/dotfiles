dotfiles
====

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf  
ln -s ~/dotfiles/.zshrc ~/.zshrc  
ln -s ~/dotfiles/.zshenv ~/.zshenv  
ln -s ~/dotfiles/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle/
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
