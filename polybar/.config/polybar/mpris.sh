#!/bin/bash

#player_status=$(playerctl -p mopidy status 2> /dev/null)
#if [[ $? -eq 0 ]]; then
#    metadata="$(playerctl -p mopidy metadata artist) - $(playerctl -p mopidy metadata title)"
#fi

player_status=$(playerctl -p spotify status 2> /dev/null)
if [[ $? -eq 0 ]]; then
    metadata="$(playerctl -p spotify metadata artist) - $(playerctl -p spotify metadata title)"
fi

if [[ $player_status = "Playing" ]]; then
    echo " %{F#99}$metadata"
else
    # Show nothing when paused (we need to echo something otherwise it keeps
    # the previous state)
    echo ""
fi
