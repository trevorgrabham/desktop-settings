#!/bin/bash

MARKER_FILE="$HOME/.last_update_marker"

# check to see if tasks have already run today
TODAY=$(date +%F)
if [[ -f "$MARKER_FILE" && "$(cat "$MARKER_FILE")" == "$TODAY" ]]; then
	exit 0 
fi

sudo ~/bin/apt-update.sh

if [[ $? -eq 0 ]]; then
	echo "$TODAY" > "$MARKER_FILE"
fi
