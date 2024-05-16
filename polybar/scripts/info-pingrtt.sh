#!/bin/sh

HOST=1.1.1.1

if ! ping=$(ping -n -c 1 -W 1 $HOST 2> /dev/null); then
    echo "%{u#ef5350}%{+u}%{F#666}%{F-}  ms"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        text="%{u#4caf50}%{+u}%{F#666}%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        text="%{u#ffeb3b}%{+u}%{F#666}%{F-}"
    else
        text="%{u#ef5350}%{+u}%{F#666}%{F-}"
    fi

    echo $text $rtt ms
fi
