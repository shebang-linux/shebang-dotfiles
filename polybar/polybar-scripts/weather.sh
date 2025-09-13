#!/usr/bin/sh

[[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]] && echo -e $(curl --user-agent 'noleak' -s "https://v3.wttr.in/?format=%C+%t" | grep -v 'Unknown')
