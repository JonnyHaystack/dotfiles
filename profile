source ~/.zshenv

export TERMINAL=alacritty
export WINIT_X11_SCALE_FACTOR=1
export QT_QPA_PLATFORMTHEME=qt5ct
export LOCKER="$HOME/scripts/i3/lock -i $HOME/Pictures/wallpaper.png"
export TORRENT_SERVER="10.0.1.102:9091"
export CPU_THERMAL_ZONE=
export POLYBAR_FS_ROOT=/home

# IBus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# Make sure dpms blanking is disabled on login
xset dpms 0 0 0

# Keyboard configuration
setxkbmap -layout us,gb -variant dvorak-alt-intl, \
  -option grp:alt_shift_toggle \
  -option compose:rctrl
xmodmap ~/.Xmodmap
