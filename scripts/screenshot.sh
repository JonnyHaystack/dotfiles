#!/usr/bin/env bash

mkdir -p ~/Pictures/Screenshots
filename=~/Pictures/Screenshots/img-$(date +%Y-%m-%d)-$(ls \
  ~/Pictures/Screenshots/img* | wc -l).png

maim --hidecursor -s $filename && notify-send -i screenie 'Screenshot' $filename
