#!/bin/bash

# Get monitor configuration
MONITORS=$(xrandr | grep " connected " | awk '{ print$1 }' | paste -d\; -s -)
IFS=';' read -r -a MONITORS <<< "$MONITORS"
export MONITORS
PRIMARY_MONITOR=$(xrandr | grep " primary " | awk '{ print$1 }' | tail -1)

MONITORS_SORTED=()
MONITORS_SORTED+=($PRIMARY_MONITOR)

for monitor in "${MONITORS[@]}"; do
  if [ "$monitor" != "$PRIMARY_MONITOR" ]; then
    MONITORS_SORTED+=($monitor)
  fi
done

for i in {1..20}
do
  monitor=${MONITORS_SORTED[$((($i - 1) % ${#MONITORS_SORTED[@]}))]}
  echo "workspace $i output $monitor"
done
