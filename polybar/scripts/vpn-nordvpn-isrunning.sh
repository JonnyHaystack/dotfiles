#!/bin/sh

nordvpn_status=$(nordvpn status | grep Status | head -n 1 | awk '{print $2}')
if [[ $nordvpn_status == *"Discon"* ]]; then
  echo "%{u#f44336}%{+u}%{F#666}%{F-}"
else
  echo "%{u#38d638}%{+u}%{F#666}%{F-}"
fi
