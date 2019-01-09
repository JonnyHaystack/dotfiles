#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitor configuration
MONITORS=$(xrandr | grep " connected " | awk '{ print$1 }' | paste -d\; -s -)
IFS=';' read -r -a MONITORS <<< "$MONITORS"
export MONITORS
export PRIMARY_MONITOR=$(xrandr | grep " primary " | awk '{ print$1 }' | tail -1)
echo Primary monitor: $PRIMARY_MONITOR

# Launch Polybar, using default config location ~/.config/polybar/config
export MONITOR=$PRIMARY_MONITOR && polybar bottom_primary &
for i in "${MONITORS[@]}"
do
  if [ "$i" != "$PRIMARY_MONITOR" ]; then
    echo External monitor: $i
    export MONITOR=$i && polybar bottom_external &
  fi
done

echo "Polybar launched..."
