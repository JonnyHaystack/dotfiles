#!/bin/bash
# Create symlinks for dotfiles so that they will appear in their
# normal locations.

# vim
ln -sfn $HOME/.dotfiles/vim $HOME/.vim
ln -sf $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/vrapper/vrapperrc $HOME/.vrapperrc
ln -sf $HOME/.dotfiles/ideavim/ideavimrc $HOME/.ideavimrc

# .inputrc
ln -sf $HOME/.dotfiles/inputrc $HOME/.inputrc

# tmux
ln -sfn $HOME/.dotfiles/tmux $HOME/.tmux
ln -sf $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# bash
ln -sf $HOME/.dotfiles/bash_config $HOME/.bash_config
touch $HOME/.bash_aliases

# git
ln -sf $HOME/.dotfiles/gitconfig $HOME/.gitconfig

# plasma
ln -sf $HOME/.dotfiles/plasma/set_window_manager.sh \
$HOME/.config/plasma-workspace/env/set_window_manager.sh

# i3
ln -sfn $HOME/.dotfiles/i3 $HOME/.config/i3
