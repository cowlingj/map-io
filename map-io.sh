#!/usr/bin/env bash

function map_io {
  DEVICE="$(awk '{print $1}' <<< "$1")"
  MONITOR="$2"
  xinput map-to-output "$DEVICE" "$MONITOR"
}

export -f map_io

yad \
  --form \
  --title 'Map Input to Display' \
  --center \
  --focus-field '1' \
  --align 'left' \
  --field \
    'Input:':CB \
    "$(paste <(xinput list --id-only) <(xinput list --name-only) | sort -n |  tr '\n' '!' | head -c -1)" \
  --field \
    'Output:':CB \
    "$(xrandr --listmonitors | awk -e 'NR != 1 { print $NF }' | sort | tr '\n' '!' | head -c -1)"  \
  --field "Apply!gtk-ok:BTN" 'bash -c "map_io %1 %2"' \
  --button "Close" "0" > /dev/null
