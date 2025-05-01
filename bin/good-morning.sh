#!/bin/bash 

start="05:59"
end="21:00"
now=$(date +%H:%M)

if [[ "$now" > "$start" && "$now" < "$end" ]]; then
    xrandr --output DP-0 --gamma 1.0:1.0:1.0
    xrandr --output DP-2 --gamma 1.0:1.0:1.0
fi
