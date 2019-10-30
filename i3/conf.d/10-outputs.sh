#!/bin/bash

# Get monitor configuration
MONITORS=$(xrandr | grep " connected " | awk '{ print$1 }' | paste -d\; -s -)
IFS=';' read -r -a MONITORS <<< "$MONITORS"
export MONITORS
PRIMARY_MONITOR=$(xrandr | grep " primary " | awk '{ print$1 }' | tail -1)

for i in {1..20}
do
  monitor=${MONITORS[$((($i - 1) % ${#MONITORS[@]}))]}
  echo "workspace $i output $monitor"
done
