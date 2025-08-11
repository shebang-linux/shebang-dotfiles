#!/usr/bin/sh

DESKTOP=$(xdotool get_desktop)
echo " $((DESKTOP + 1)) / $(xdotool get_num_desktops) "
