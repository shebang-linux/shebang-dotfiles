#!/usr/bin/sh

[[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]] && echo -e $(curl -s "https://v3.wttr.in/?format=%C+%t") ;
