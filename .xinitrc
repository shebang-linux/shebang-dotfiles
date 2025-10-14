exec nice -n 19 ionice -c2 -n7 pipewire &
exec nice -n 19 ionice -c2 -n7 dbus-launch --exit-with-session openbox-session
