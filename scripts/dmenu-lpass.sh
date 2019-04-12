#!/bin/bash

selection=$(echo -e $(lpass ls | awk -F '[/[]' '{print $(NF-1)"\\n"}' \
  | tr -d '[:space:]') | rofi -dmenu -p Lastpass)

shopt -s extglob
selection="${selection##*( )}"
selection="${selection%%*( )}"
shopt -u extglob

if [ "$selection" != "" ]; then
    lpass show -c --password "${selection}" &
fi
