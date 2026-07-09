#!/usr/bin/env bash

FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)
MONITOR_COUNT=$(aerospace list-monitors 2>/dev/null | wc -l | tr -d ' ')

DATA=$(aerospace list-workspaces --monitor all \
  --format '%{workspace} %{monitor-id} %{workspace-is-visible}' 2>/dev/null \
  | awk '$3 == "true" {print $2, $1}' \
  | sort -k1 -n \
  | awk '{print $2}')

WS1=$(echo "$DATA" | sed -n '1p')
WS2=$(echo "$DATA" | sed -n '2p')

# Left item
sketchybar --set aerospace_left label="${WS1:-?}"
if [ "$WS1" = "$FOCUSED" ]; then
  sketchybar --set aerospace_left background.color=0x44ffffff label.color=0xffffffff
else
  sketchybar --set aerospace_left background.color=0x00000000 label.color=0x88ffffff
fi

# Separator + right item: only show when two monitors connected
if [ "$MONITOR_COUNT" -ge 2 ] && [ -n "$WS2" ]; then
  sketchybar --set aerospace_sep drawing=on
  sketchybar --set aerospace_right drawing=on label="$WS2"
  if [ "$WS2" = "$FOCUSED" ]; then
    sketchybar --set aerospace_right background.color=0x44ffffff label.color=0xffffffff
  else
    sketchybar --set aerospace_right background.color=0x00000000 label.color=0x88ffffff
  fi
else
  sketchybar --set aerospace_sep drawing=off
  sketchybar --set aerospace_right drawing=off
fi
