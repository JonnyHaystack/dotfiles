#!/bin/bash
# Create symlinks for dotfiles so that they will appear in their
# normal locations.

ln -sfn $HOME/.dotfiles/vim $HOME/.vim
ln -sf $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/inputrc $HOME/.inputrc
ln -sfn $HOME/.dotfiles/tmux $HOME/.tmux
ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf
ln -sf $HOME/.dotfiles/bash_config $HOME/.bash_config
touch $HOME/.bash_aliases
