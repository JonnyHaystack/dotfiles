#!/bin/sh

nordvpn_status=$(nordvpn status | grep Status | head -n 1)
if [[ $nordvpn_status == *"Connected"* ]]; then
  echo "%{u#4caf50}%{+u}%{F#666}%{F-}"
else
  echo "%{u#ef5350}%{+u}%{F#666}%{F-}"
fi
