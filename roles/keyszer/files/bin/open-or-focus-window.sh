#!/bin/bash

wanted_id="$(xdotool search --limit=1 --classname "$1")"
current_id="$(xdotool getwindowfocus)"

if [[ -z "$wanted_id" ]]; then
  runuser -u "$2" -- "/bin/$1-gui" &
  exit 0
fi

if [[ "$current_id" == "$wanted_id" ]]; then
  xdotool windowminimize "$wanted_id"
else
  xdotool windowactivate "$wanted_id"
fi
