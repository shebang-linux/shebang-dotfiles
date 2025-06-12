#!/usr/bin/env bash

[[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]] && news_feed=$(curl -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://simplifiedprivacy.com/index.xml)

counter=1

while [ $counter -le 5 ]
do
	news_title=$(echo "$news_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR=='$counter'')
	news_link=$(echo "$news_feed" | xmlstarlet sel -t -m '//item' -v 'link' -n | awk 'NR=='$counter'')

	[[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]] && notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$news_title" "Read complete article here") && [[ $notify == "open" ]] && xdg-open "$news_link" &

	echo ""

	((counter++))
done
