#!/usr/bin/sh

[[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]] && CAROUSEL=$(curl -s "https://v3.wttr.in/?format=%s" | head -c5 | tr -d '[:space:]')

if [[ "$CAROUSEL" > 05:30 ]] && [[ "$CAROUSEL" < 17:30 ]]; then
	pcmanfm-qt --set-wallpaper /usr/share/backgrounds/wallpaper_2.png >/dev/null 2>&1
else
	pcmanfm-qt --set-wallpaper /usr/share/backgrounds/wallpaper.png >/dev/null 2>&1
fi

[[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]] && echo -e $(curl -s "https://v3.wttr.in/?format=%C+%t" | tr -d '[:space:]')
