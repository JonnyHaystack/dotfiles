#!/bin/sh

if [ "$(pidof openvpn)" ]; then
    echo "%{u#38d638}%{F#666}%{F-}"
else
    echo "%{u#f44336}%{F#666}%{F-}"
fi
