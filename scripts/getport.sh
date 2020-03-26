#!/usr/bin/env bash

host="$1"

mac=$(arp "$host" | tail -n 1 | awk '{print $3}')

read -sp "Enter password: " password

echo
result=$(getmacs "$password" | grep -i "$mac" | sed 's/ |//g' | awk '{$1=$1;print}')
(printf "VID MAC Type Ports\n"; echo $result) | column -t
