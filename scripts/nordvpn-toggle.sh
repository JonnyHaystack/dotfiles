#!/usr/bin/env bash

nordvpn_status=$(nordvpn status | grep Status | head -n 1)
if [[ $nordvpn_status == *"Connected"* ]]; then
  nordvpn disconnect
else
  nordvpn connect
fi
