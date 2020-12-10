#!/bin/sh

protonvpn_status=$(protonvpn s | grep Status | head -n 1)
if [[ $protonvpn_status == *"Connected"* ]]; then
  echo "%{u#4caf50}%{+u}%{F#666}%{F-}"
else
  echo "%{u#ef5350}%{+u}%{F#666}%{F-}"
fi
