#!/usr/bin/env bash

nordvpn_status=$(nordvpn status | head -n 1 | awk '{print $2}')
if [[ $nordvpn_status == *"Discon"* ]]; then
  nordvpn connect
else
  nordvpn disconnect
fi