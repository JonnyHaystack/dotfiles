#!/usr/bin/env bash

# This script creates symlinks for dotfiles so that they will appear in their
# normal locations.

remove_non_dirlink() {
  if [[ ! (-L $1 && -d $1) ]]; then
    echo "${1} is an existing directory, do you want to overwrite it with a symlink?"
    rm -rI $1
  fi
}

git submodule init
git submodule update

mkdir -p $HOME/.config/

# scripts
mkdir -p $HOME/scripts/
mkdir -p $HOME/bin/
ln -sfn $HOME/.dotfiles/scripts/i3 $HOME/scripts/i3
ln -sf $HOME/.dotfiles/scripts/dmenu-custom.sh $HOME/bin/dmenu-custom
ln -sf $HOME/.dotfiles/scripts/dmenu-lpass.sh $HOME/bin/dmenu-lpass
ln -sf $HOME/.dotfiles/scripts/networkmanager_dmenu \
  $HOME/bin/networkmanager_dmenu
ln -sf $HOME/.dotfiles/scripts/rofi-lpass.sh $HOME/bin/rofi-lpass
ln -sf $HOME/.dotfiles/scripts/rofi-calculator.sh $HOME/bin/rofi-calculator
ln -sf $HOME/.dotfiles/scripts/rofi-file-browser.sh $HOME/bin/rofi-file-browser
ln -sf $HOME/.dotfiles/scripts/open_url_in_instance.sh $HOME/bin/qutebrowser
ln -sf $HOME/.dotfiles/scripts/screenshot.sh $HOME/bin/screenshot

# desktop shortcuts
mkdir -p $HOME/.local/share/applications/
ln -sf $HOME/.dotfiles/desktop/* $HOME/.local/share/applications/

# fonts
mkdir -p $HOME/.fonts/
ln -sf $HOME/.dotfiles/fonts/* $HOME/.fonts/

# vim
ln -sfn $HOME/.dotfiles/vim $HOME/.vim
ln -sf $HOME/.dotfiles/vim/vimrc $HOME/.vimrc
ln -sf $HOME/.dotfiles/vrapper/vrapperrc $HOME/.vrapperrc
ln -sf $HOME/.dotfiles/ideavim/ideavimrc $HOME/.ideavimrc

# neovim
ln -sfn $HOME/.dotfiles/nvim $HOME/.config/nvim

# .inputrc
ln -sf $HOME/.dotfiles/inputrc $HOME/.inputrc

# tmux
mkdir -p $HOME/.tmux/
ln -sf $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux/tmux.conf
ln -sf $HOME/.dotfiles/tmux/tmux.conf $HOME/.tmux.conf

# bash
ln -sf $HOME/.dotfiles/bash_config $HOME/.bash_config
touch $HOME/.bash_aliases

# zsh
ln -sf $HOME/.dotfiles/zsh/zshrc $HOME/.zshrc
cp -n $HOME/.dotfiles/zsh/zshenv $HOME/.zshenv
touch $HOME/.zsh_local
touch $HOME/.zsh_aliases

# fzf
remove_non_dirlink $HOME/.fzf
ln -sfn $HOME/.dotfiles/fzf $HOME/.fzf
$HOME/.fzf/install --all

# alacritty
mkdir -p $HOME/.config/alacritty/
ln -sf $HOME/.dotfiles/alacritty/alacritty.yml \
  $HOME/.config/alacritty/alacritty.yml

# termite
mkdir -p $HOME/.config/termite/
ln -sf $HOME/.dotfiles/termite/config $HOME/.config/termite/config

# kitty
remove_non_dirlink $HOME/.config/kitty
ln -sfn $HOME/.dotfiles/kitty $HOME/.config/kitty

# git
ln -sf $HOME/.dotfiles/gitconfig $HOME/.gitconfig

# plasma
mkdir -p $HOME/.config/plasma-workspace/env/
ln -sf $HOME/.dotfiles/plasma/set_window_manager.sh \
  $HOME/.config/plasma-workspace/env/set_window_manager.sh

# i3
mkdir -p $HOME/.config/i3/
ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config
mkdir -p $HOME/.i3/

# sway
mkdir -p $HOME/.config/sway/
ln -sf $HOME/.dotfiles/sway/config $HOME/.config/sway/config

# i3status
mkdir -p $HOME/.config/i3status/
ln -sf $HOME/.dotfiles/i3status/config $HOME/.config/i3status/config

# polybar
mkdir -p $HOME/.config/polybar/
ln -sf $HOME/.dotfiles/polybar/* $HOME/.config/polybar/
ln -sfn $HOME/.dotfiles/polybar/scripts $HOME/polybar-scripts

# compton
mkdir -p $HOME/.config/compton/
ln -sf $HOME/.dotfiles/compton/compton.conf $HOME/.config/compton/compton.conf

# dunst
mkdir -p $HOME/.config/dunst/
ln -sf $HOME/.dotfiles/dunst/dunstrc $HOME/.config/dunst/dunstrc

# autorandr
mkdir -p $HOME/.config/autorandr/
ln -sf $HOME/.dotfiles/autorandr/postswitch $HOME/.config/autorandr/postswitch

# qutebrowser
mkdir -p $HOME/.config/qutebrowser/bookmarks/
mkdir -p $HOME/.local/share/qutebrowser/userscripts/
ln -sf $HOME/.dotfiles/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
ln -sf $HOME/.dotfiles/qutebrowser/userscripts/* \
  $HOME/.local/share/qutebrowser/userscripts/

# rofi
remove_non_dirlink $HOME/.config/rofi
ln -sfn $HOME/.dotfiles/rofi $HOME/.config/rofi

# mpv
remove_non_dirlink $HOME/.config/mpv
ln -sfn $HOME/.dotfiles/mpv $HOME/.config/mpv

# ncmpcpp
remove_non_dirlink $HOME/.config/ncmpcpp
ln -sfn $HOME/.dotfiles/ncmpcpp $HOME/.config/ncmpcpp

# zathura
mkdir -p $HOME/.config/zathura/
ln -sf $HOME/.dotfiles/zathura/zathurarc $HOME/.config/zathura/zathurarc

# feh
remove_non_dirlink $HOME/.config/feh
ln -sfn $HOME/.dotfiles/feh $HOME/.config/feh
