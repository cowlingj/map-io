#!/usr/bin/env bash

FORM="$(yad \
  --form \
  --title 'Map Input to Display' \
  --item-separator '\n' \
  --width '600' \
  --height '800' \
  --center \
  --focus-field '1' \
  --align 'left' \
  --field \
    'Input::CB' \
    "$(paste <(xinput list --id-only) <(xinput list --name-only))" \
  --field \
    'Output::CB' \
    "$(xrandr --listmonitors | awk -e 'NR != 1 { print $NF }')"
)"

if [ "$?" != "0" ]; then
  echo "operation cancelled" >& 2
  exit 1
fi

DEVICE="$(awk -F '|' '{print $1}' <<< "$FORM" | awk '{print $1}')"
MONITOR="$(awk -F '|' '{print $2}' <<< "$FORM" | awk '{print $NF}')"

unset FORM

xinput map-to-output "$DEVICE" "$MONITOR"

unset DEVICE MONITOR

