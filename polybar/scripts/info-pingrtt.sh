#!/bin/sh

HOST=google.com

if ! ping=$(ping -n -c 1 -W 1 $HOST); then
    echo "# ping failed"
else
    rtt=$(echo "$ping" | sed -rn 's/.*time=([0-9]{1,})\.?[0-9]{0,} ms.*/\1/p')

    if [ "$rtt" -lt 50 ]; then
        text="%{u#38d638}%{F#666}%{F-}"
    elif [ "$rtt" -lt 150 ]; then
        text="%{u#e6d937}%{F#666}%{F-}"
    else
        text="%{u#f44336}%{F#666}%{F-}"
    fi

    echo $text $rtt ms
fi
