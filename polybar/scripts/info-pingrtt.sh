#!/bin/sh

HOST=google.com

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "# ping failed"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        text="%{F#3cb703}%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        text="%{F#f9dd04}%{F-}"
    else
        text="%{F#d60606}%{F-}"
    fi

    echo $text $rtt ms
fi
