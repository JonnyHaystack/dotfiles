#!/usr/bin/env bash

# Clear config. Unlike rm this should work on symlinks.
echo "" > $HOME/.config/i3/config

# Concatenate config files and script outputs into i3 config.
for filename in $HOME/.config/i3/conf.d/*; do
  case $filename in
  *.conf)
    cat $filename >> $HOME/.config/i3/config
    ;;
  *.sh)
    $filename >> $HOME/.config/i3/config
    ;;
  esac
done

i3-msg restart
