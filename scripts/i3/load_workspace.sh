#!/bin/bash

if [ "$#" -eq 1 ]
then
  i3-msg "workspace --no-auto-back-and-forth $1; append_layout ~/.i3/workspace_$1.json"

  source ~/.i3/workspace_$1.sh
fi
