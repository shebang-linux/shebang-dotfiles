#!/usr/bin/sh

case "$1" in
    --toggle)
        if [[ ! -e "$HOME/.config/polybar/polybar-scripts/dnd" ]]; then
            touch "$HOME/.config/polybar/polybar-scripts/dnd"
            dunstctl set-paused true
        else
            rm "$HOME/.config/polybar/polybar-scripts/dnd"
            dunstctl set-paused false
        fi
        ;;
    *)
        if [ "$(dunstctl is-paused)" = "true" ]; then
            if [[ ! -e "$HOME/.config/polybar/polybar-scripts/dnd" ]]; then
                ( xdotool getwindowgeometry "$(xdotool getactivewindow)" | \
                  grep -q "$(xdpyinfo | grep dimensions | awk '{print $2}')" || \
                  dunstctl set-paused false ) &>/dev/null
            fi
            dunstctl close-all
            dunstctl history-clear
            echo -e "\uf0a2"
        else
            if [[ ! -e "$HOME/.config/polybar/polybar-scripts/dnd" ]]; then
                ( xdotool getwindowgeometry "$(xdotool getactivewindow)" | \
                  grep -q "$(xdpyinfo | grep dimensions | awk '{print $2}')" && \
                  dunstctl set-paused true ) &>/dev/null
            fi
            echo -e "\uf0f3"
        fi
        ;;
esac
