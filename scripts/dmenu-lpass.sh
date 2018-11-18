#!/bin/bash


selection=$(echo -e $(lpass ls | awk -F '[/[]' '{print $(NF-1)"\\n"}') | ~/bin/dmenu-custom -l 10)

if [ "$selection" != "" ]; then
    lpass show -c --password $selection &
fi
