#!/bin/bash

# Terminate already running bar instances
killall -q polybar
ps -ef | grep 'hideIt.sh' | grep -v grep | awk '{print $2}' | xargs -r kill -9

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitor configuration
MONITORS=$(xrandr | grep " connected " | awk '{ print$1 }' | paste -d\; -s -)
IFS=';' read -r -a MONITORS <<< "$MONITORS"
export MONITORS
PRIMARY_MONITOR=$(xrandr | grep " primary " | awk '{ print$1 }' | tail -1)
echo Primary monitor: $PRIMARY_MONITOR

# Launch Polybar, using default config location ~/.config/polybar/config
export MONITOR=$PRIMARY_MONITOR
polybar systray &
for i in "${MONITORS[@]}"
do
  echo Monitor: $i
  export MONITOR=$i
  polybar bottom &
done

echo "Polybar launched..."

# Use hideIt.sh script to hide taskbar unless hovered on.
bottom_left=$(xrandr | grep -w primary | awk -F'[x+ ]' '{print $6"x"$5+$7-36}')
exec hideIt.sh -w --name '^Polybar tray window$' --region "$bottom_left"+10+-40
