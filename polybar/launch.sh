#!/usr/bin/env bash

# Terminate already running bar instances
for p in $(pgrep polybar); do kill $p; done
ps -ef | grep 'hideIt.sh' | grep -v grep | awk '{print $2}' | xargs -r kill -9

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Get monitor configuration
MONITORS=$(xrandr --listactivemonitors | tail +2 | awk '{print $4}' | paste -d\; -s -)
IFS=';' read -r -a MONITORS <<< "$MONITORS"
export MONITORS
PRIMARY_MONITOR=$(xrandr | grep " primary " | awk '{ print$1 }' | tail -1)
echo Primary monitor: $PRIMARY_MONITOR

# Launch Polybar, using default config location ~/.config/polybar/config.ini
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
exec ~/bin/hideIt.sh -S -w --name 'polybar-systray' --direction bottom -p 0
