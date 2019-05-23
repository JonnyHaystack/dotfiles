#!/bin/zsh
source "$HOME/polybar-scripts/rofi-widgets/wrapper/rofi.sh"

animationSpeed=30

USBICON=
HDMIICON=
PCIICON=

if [[ $(pgrep "rofi") ]]; then
        exit 1
fi

rofi_load_vars sound

rofi_dmenu &

rofi_window_pop +

rofi_dmenu_read

choice=$(echo "${choice}" | awk '{print $1}')

if [ "$choice" ]; then
        pactl set-default-sink "${choice}"
else
        exit 1
fi
