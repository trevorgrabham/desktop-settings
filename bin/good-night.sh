#!/bin/bash 

start="20:59"
end="06:00"
now=$(date +%H:%M)

if [[ "$now" > "$start" || "$now" < "$end" ]]; then
    xrandr --output DP-0 --gamma 0.9:0.8:0.6
    xrandr --output DP-2 --gamma 0.9:0.8:0.6
fi
