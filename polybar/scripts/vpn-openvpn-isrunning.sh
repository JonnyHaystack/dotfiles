#!/bin/sh

if [ "$(pidof openvpn)" ]; then
    echo "%{F#3cb703}%{F-}"
else
    echo ""
fi
