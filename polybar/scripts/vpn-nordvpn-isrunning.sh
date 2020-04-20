#!/bin/sh

nordvpn_status=$(nordvpn status | grep Status | head -n 1)
if [[ $nordvpn_status == *"Connected"* ]]; then
  echo "%{u#38d638}%{+u}%{F#666}%{F-}"
else
  echo "%{u#f44336}%{+u}%{F#666}%{F-}"
fi
