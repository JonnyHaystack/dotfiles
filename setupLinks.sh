#!/bin/bash
# Create symlinks for dotfiles so that they will appear in their
# normal locations.

ln -s vim $HOME/.vim
ln -s vim/vimrc $HOME/.vimrc
ln -s inputrc $HOME/.inputrc
ln -s tmux.conf $HOME/.tmux.conf
