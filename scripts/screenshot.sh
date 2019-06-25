#!/usr/bin/env bash

filename=~/Pictures/Screenshots/img-$(date +%Y-%m-%d)-$(ls \
  ~/Pictures/Screenshots/img* | wc -l).png

scrot -s $filename && notify-send -i screenie 'Screenshot' $filename
