#!/usr/bin/env bash

if [ -z "$1" ]; then
  tmux ls | awk -F ':' '{print $1}'
else
  nohup "$TERMINAL" -e tmux a -t "$1" > /dev/null 2>&1 & disown
fi
