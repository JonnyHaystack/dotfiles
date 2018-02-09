#!/bin/bash
# Create symlinks for dotfiles so that they will appear in their
# normal locations.

ln -sf .dotfiles/vim $HOME/.vim
ln -sf .dotfiles/vim/vimrc $HOME/.vimrc
ln -sf .dotfiles/inputrc $HOME/.inputrc
ln -sf .dotfiles/tmux.conf $HOME/.tmux.conf
ln -sf .dotfiles/bash_config $HOME/.bash_config
ln -sf .dotfiles/bash_aliases $HOME/.bash_aliases
