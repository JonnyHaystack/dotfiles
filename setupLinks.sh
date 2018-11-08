#!/bin/bash
# Create symlinks for dotfiles so that they will appear in their
# normal locations.

# scripts
mkdir $HOME/scripts/
ln -sfn $HOME/.dotfiles/scripts/i3/ $HOME/scripts/i3

# desktop shortcuts
mkdir -p $HOME/.local/share/applications/
ln -sf $HOME/.dotfiles/desktop/pingtest.desktop \
$HOME/.local/share/applications/pingtest.desktop

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
mkdir -p $HOME/.config/plasma-workspace/env/
ln -sf $HOME/.dotfiles/plasma/set_window_manager.sh \
$HOME/.config/plasma-workspace/env/set_window_manager.sh

# i3
mkdir -p $HOME/.config/i3/
ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config

# autorandr
mkdir -p $HOME/.config/autorandr/
ln -sf $HOME/.dotfiles/autorandr/postswitch $HOME/.config/autorandr/postswitch

# alacritty
mkdir -p $HOME/.config/alacritty/
ln -sf $HOME/.dotfiles/alacritty.yml $HOME/.config/alacritty/alacritty.yml
