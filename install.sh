#!/usr/bin/env bash
#
# This script creates symlinks for dotfiles so that they will appear in their
# normal locations.
#

remove_non_dirlink() {
  if [[ ! (-L $1 && -d $1) && -d $1 || -f $1 ]]; then
    echo "${1} exists, do you want to overwrite it with a symlink?"
    rm -rI $1
  fi
}

# Get dotfiles clone path
DIR="$(dirname "$(readlink -f "$0")")"

# Fetch submodules
cd $DIR
git submodule init
git submodule update

# Make config directory
mkdir -p $HOME/.config/

# scripts
mkdir -p $HOME/bin/
ln -sf $DIR/bin/* $HOME/bin/

remove_non_dirlink $HOME/lib
ln -sfn $DIR/lib $HOME/lib

remove_non_dirlink $HOME/scripts
ln -sfn $DIR/scripts $HOME/scripts
ln -sf $DIR/scripts/diff-so-fancy/diff-so-fancy $HOME/bin/diff-so-fancy
ln -sf $DIR/scripts/slip/slip $HOME/bin/slip

# desktop shortcuts
mkdir -p $HOME/.local/share/applications/
ln -sf $DIR/desktop/* $HOME/.local/share/applications/

# fonts
mkdir -p $HOME/.fonts/
ln -sf $DIR/fonts/* $HOME/.local/share/fonts/

# default .profile
cp -n $DIR/profile $HOME/.profile

# default keyboard remappings
cp -n $DIR/Xmodmap $HOME/.Xmodmap

# Compose mappings
ln -sf $DIR/XCompose $HOME/.XCompose

# vim
remove_non_dirlink $HOME/.vim
ln -sfn $DIR/vim $HOME/.vim
ln -sf $DIR/vim/vimrc $HOME/.vimrc
ln -sf $DIR/vrapper/vrapperrc $HOME/.vrapperrc
ln -sf $DIR/ideavim/ideavimrc $HOME/.ideavimrc
mkdir -p $HOME/.vim-backup

# neovim
remove_non_dirlink $HOME/.config/nvim
ln -sfn $DIR/nvim $HOME/.config/nvim

# yapf
remove_non_dirlink $HOME/.config/yapf
ln -sfn $DIR/yapf $HOME/.config/yapf

# .inputrc
ln -sf $DIR/inputrc $HOME/.inputrc

# .npmrc
ln -sf $DIR/npm/npmrc $HOME/.npmrc

# tmux
mkdir -p $HOME/.tmux/
ln -sf $DIR/tmux/tmux.conf $HOME/.tmux/tmux.conf
ln -sf $DIR/tmux/tmux.conf $HOME/.tmux.conf

# bash
ln -sf $DIR/bash_config $HOME/.bash_config
touch $HOME/.bash_aliases

# zsh
ln -sf $DIR/zsh/zshrc $HOME/.zshrc
cp -n $DIR/zsh/zshenv $HOME/.zshenv
cp -n $DIR/zsh/zsh_aliases $HOME/.zsh_aliases

# fzf
remove_non_dirlink $HOME/.fzf
ln -sfn $DIR/fzf $HOME/.fzf
$HOME/.fzf/install --all

# alacritty
mkdir -p $HOME/.config/alacritty/
ln -sf $DIR/alacritty/alacritty.toml \
  $HOME/.config/alacritty/alacritty.toml

# termite
mkdir -p $HOME/.config/termite/
ln -sf $DIR/termite/config $HOME/.config/termite/config

# kitty
remove_non_dirlink $HOME/.config/kitty
ln -sfn $DIR/kitty $HOME/.config/kitty

# git
ln -sf $DIR/gitconfig $HOME/.gitconfig

# qt5ct
remove_non_dirlink $HOME/.config/qt5ct
ln -sfn $DIR/qt5ct $HOME/.config/qt5ct

# gtk-3.0 (lxappearance)
mkdir -p $HOME/.config/gtk-3.0/
ln -sf "$DIR/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"

# plasma
mkdir -p $HOME/.config/plasma-workspace/env/
ln -sf $DIR/plasma/set_window_manager.sh \
  $HOME/.config/plasma-workspace/env/set_window_manager.sh

# i3
mkdir -p $HOME/.config/i3
remove_non_dirlink $HOME/.config/i3/conf.d
ln -sfn $DIR/i3/conf.d $HOME/.config/i3/conf.d
ln -sf $DIR/i3/restart.sh $HOME/.config/i3/restart.sh
cp -n $DIR/i3/bootstrap_config $HOME/.config/i3/config

# sway
mkdir -p $HOME/.config/sway/
ln -sf $DIR/sway/config $HOME/.config/sway/config

# i3-resurrect
remove_non_dirlink $HOME/.config/i3-resurrect
ln -sfn $DIR/i3-resurrect $HOME/.config/i3-resurrect

# i3status
mkdir -p $HOME/.config/i3status/
ln -sf $DIR/i3status/config $HOME/.config/i3status/config

# polybar
mkdir -p $HOME/.config/polybar/
ln -sf $DIR/polybar/* $HOME/.config/polybar/
remove_non_dirlink $HOME/polybar-scripts
ln -sfn $DIR/polybar/scripts $HOME/polybar-scripts

# picom
mkdir -p $HOME/.config/picom/
ln -sf $DIR/picom/picom.conf $HOME/.config/picom/picom.conf

# dunst
mkdir -p $HOME/.config/dunst/
ln -sf $DIR/dunst/dunstrc $HOME/.config/dunst/dunstrc

# autorandr
mkdir -p $HOME/.config/autorandr/
ln -sf $DIR/autorandr/postswitch $HOME/.config/autorandr/postswitch

# qutebrowser
mkdir -p $HOME/.config/qutebrowser/bookmarks/
mkdir -p $HOME/.local/share/qutebrowser/userscripts/
ln -sf $DIR/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
ln -sf $DIR/qutebrowser/userscripts/* \
  $HOME/.local/share/qutebrowser/userscripts/

# rofi
remove_non_dirlink $HOME/.config/rofi
ln -sfn $DIR/rofi $HOME/.config/rofi

# mpv
remove_non_dirlink $HOME/.config/mpv
ln -sfn $DIR/mpv $HOME/.config/mpv

# ncmpcpp
remove_non_dirlink $HOME/.config/ncmpcpp
ln -sfn $DIR/ncmpcpp $HOME/.config/ncmpcpp

# zathura
mkdir -p $HOME/.config/zathura/
ln -sf $DIR/zathura/zathurarc $HOME/.config/zathura/zathurarc

# feh
remove_non_dirlink $HOME/.config/feh
ln -sfn $DIR/feh $HOME/.config/feh

# htop
remove_non_dirlink $HOME/.config/htop
ln -sfn $DIR/htop $HOME/.config/htop

# ranger
mkdir -p $HOME/.config/ranger/
ln -sf $DIR/ranger/rc.conf $HOME/.config/ranger/rc.conf
remove_non_dirlink $HOME/.config/ranger/plugins
ln -sfn $DIR/ranger/plugins $HOME/.config/ranger/plugins

# slip
mkdir -p $HOME/.config/slip
ln -sf $DIR/slip/config $HOME/.config/slip/config

# todo.txt
mkdir -p $HOME/.todo
ln -sf $DIR/todo/config $HOME/.todo/config
