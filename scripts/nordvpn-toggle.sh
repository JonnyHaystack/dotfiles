#!/usr/bin/env bash

nordvpn_status=$(nordvpn status | grep Status | head -n 1)
if [[ $nordvpn_status == *"Discon"* ]]; then
  nordvpn connect
else
  nordvpn disconnect
fi
