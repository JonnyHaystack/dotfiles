#!/bin/bash
# Create symlinks for dotfiles so that they will appear in their
# normal locations.

mkdir -p $HOME/.config/

# scripts
mkdir -p $HOME/scripts/
mkdir -p $HOME/bin/
ln -sfn $HOME/.dotfiles/scripts/i3 $HOME/scripts/i3
ln -sf $HOME/.dotfiles/scripts/dmenu-custom.sh $HOME/bin/dmenu-custom
ln -sf $HOME/.dotfiles/scripts/dmenu-lpass.sh $HOME/bin/dmenu-lpass
ln -sf $HOME/.dotfiles/scripts/open_url_in_instance.sh $HOME/bin/qutebrowser

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
git submodule init
git submodule update
ln -sfn $HOME/.dotfiles/fzf $HOME/.fzf
$HOME/.fzf/install

# git
ln -sf $HOME/.dotfiles/gitconfig $HOME/.gitconfig

# plasma
mkdir -p $HOME/.config/plasma-workspace/env/
ln -sf $HOME/.dotfiles/plasma/set_window_manager.sh \
  $HOME/.config/plasma-workspace/env/set_window_manager.sh

# i3
mkdir -p $HOME/.config/i3/
ln -sf $HOME/.dotfiles/i3/config $HOME/.config/i3/config

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

# alacritty
mkdir -p $HOME/.config/alacritty/
ln -sf $HOME/.dotfiles/alacritty/alacritty.yml \
  $HOME/.config/alacritty/alacritty.yml

# qutebrowser
mkdir -p $HOME/.config/qutebrowser/bookmarks/
mkdir -p $HOME/.local/share/qutebrowser/userscripts/
ln -sf $HOME/.dotfiles/qutebrowser/config.py $HOME/.config/qutebrowser/config.py
ln -sf $HOME/.dotfiles/qutebrowser/userscripts/* \
  $HOME/.local/share/qutebrowser/userscripts/

# rofi
ln -sfn $HOME/.dotfiles/rofi $HOME/.config/rofi

# mpv
mkdir -p $HOME/.config/mpv/
mkdir -p $HOME/.config/mpv/scripts/
ln -sf $HOME/.dotfiles/mpv/input.conf $HOME/.config/mpv/input.conf
ln -sf $HOME/.dotfiles/mpv/scripts/youtube-quality.lua \
  $HOME/.config/mpv/scripts/youtube-quality.lua

# ncmpcpp
ln -sfn $HOME/.dotfiles/ncmpcpp $HOME/.config/ncmpcpp

# zathura
mkdir -p $HOME/.config/zathura/
ln -sf $HOME/.dotfiles/zathura/zathurarc $HOME/.config/zathura/zathurarc
