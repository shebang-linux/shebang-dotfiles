#!/usr/bin/sh

case "$1" in
    --toggle)
        if [[ ! -e "$HOME/.config/polybar/polybar-scripts/dnd" ]]; then
	    dunstctl set-paused true

            touch "$HOME/.config/polybar/polybar-scripts/dnd"
        else
	    dunstctl set-paused false

            rm "$HOME/.config/polybar/polybar-scripts/dnd"
        fi
        ;;
    *)
        if [ "$(dunstctl is-paused)" = "true" ]; then
            if [[ ! -e "$HOME/.config/polybar/polybar-scripts/dnd" ]]; then
                xdotool getwindowgeometry "$(xdotool getactivewindow)" | \
                grep -q "$(xdpyinfo | grep dimensions | awk '{print $2}')" || \
                dunstctl set-paused false
            fi

            dunstctl close-all
            dunstctl history-clear

            echo -e "\uf0a2"
        else
            if [[ ! -e "$HOME/.config/polybar/polybar-scripts/dnd" ]]; then
                xdotool getwindowgeometry "$(xdotool getactivewindow)" | \
                grep -q "$(xdpyinfo | grep dimensions | awk '{print $2}')" && \
                dunstctl set-paused true
            fi

            echo -e "\uf0f3"
        fi
        ;;
esac
