#!/bin/bash

INTERFACE=$(iwctl device list | awk '/station/ {print $1}' | head -n 1)

NETWORK=$(iwctl station "$INTERFACE" get-networks | awk 'NR>4 {print $2}' | wofi --dmenu -p "Wi-Fi Networks")

[ -z "$NETWORK" ] && exit

iwctl station "$INTERFACE" connect "$NETWORK"

