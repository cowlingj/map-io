#!/usr/bin/env bash

function reset_mapping {
  DEVICE="$(awk '{print $1}' <<< "$1")"
  xinput set-prop "$DEVICE" 'Coordinate Transformation Matrix' 1.0 0.0 0.0 0.0 1.0 0.0 0.0 0.0 1.0 > test.txt
}

function map_io {
  DEVICE="$(awk '{print $1}' <<< "$1")"
  MONITOR="$2"
  xinput map-to-output "$DEVICE" "$MONITOR"
}

export -f map_io reset_mapping

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
    "$(xrandr --listmonitors | awk 'NR != 1 { print $NF }' | sort | tr '\n' '!' | head -c -1)"  \
  --field "Apply!gtk-ok:BTN" 'bash -c "map_io %1 %2"' \
  --field "Reset Input Device:BTN" 'bash -c "reset_mapping %1' \
  --button "Close" "0" > /dev/null
