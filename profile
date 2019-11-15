# Set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export PATH="$HOME/.cargo/bin:$PATH"
export TERMINAL=alacritty
export EDITOR=nvim
export WINIT_HIDPI_FACTOR=1
export QT_QPA_PLATFORMTHEME=gtk2
export LOCKER="$HOME/scripts/i3/lock -i $HOME/Pictures/wallpaper.png"
export TORRENT_SERVER="192.168.1.102:9091"
export CPU_THERMAL_ZONE=
export POLBYAR_FS_ROOT=/home

# Make sure dpms blanking is disabled on login
xset dpms 0 0

# Keyboard configuration
setxkbmap -layout us,gb -variant dvorak, \
  -option grp:alt_shift_toggle \
  -option lv3:lalt_switch -option poundsign:3 \
  -option caps:super
