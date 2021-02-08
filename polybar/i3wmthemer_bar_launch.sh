#!/bin/env sh

pkill polybar

sleep 1;

launch() {
    echo "Launch polybar on $MONITOR"
    polybar --reload i3wmthemer_bar 2>> ./logfile &
}


if type "xrandr";
then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1);
    do
        MONITOR=$m polybar --reload i3wmthemer_bar 2>> ./logfile &
    done
else
    polybar --reload i3wmthemer_bar 2>> ./logfile &
fi

# if type "xrandr";
# then
#     launch
# else
#     launch 
# fi
