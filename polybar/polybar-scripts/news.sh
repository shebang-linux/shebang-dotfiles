#!/usr/bin/sh

if [[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]]; then
	news_feed=$(curl --user-agent 'noleak' -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://www.cnbc.com/id/100727362/device/rss/rss.html)
	articles_feed=$(curl --user-agent 'noleak' -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://simplifiedprivacy.com/index.xml)
	podcasts_feed=$(curl --user-agent 'noleak' -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://podcast.simplifiedprivacy.com/index.xml)
	videos_feed=$(curl --user-agent 'noleak' -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://shadow.arweave.net/index.xml)

	news_title=$(echo -e "$news_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR==1')
	news_link=$(echo -e "$news_feed" | xmlstarlet sel -t -m '//item' -v 'link' -n | awk 'NR==1')
	articles_title=$(echo -e "$articles_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR==1')
	articles_link=$(echo -e "$articles_feed" | xmlstarlet sel -t -m '//item' -v 'link' -n | awk 'NR==1')
	podcasts_title=$(echo -e "$podcasts_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR==1')
	podcasts_link=$(echo -e "$podcasts_feed" | xmlstarlet sel -t -m '//item' -v 'link' -n | awk 'NR==1')
	videos_title=$(echo -e "$videos_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR==1')
	videos_link=$(echo -e "$videos_feed" | xmlstarlet sel -t -m '//item' -v "//*[local-name()='content']/@url" -n | awk 'NR==1')

	notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$news_title" "Read complete news here") && [[ $notify == "open" ]] && xdg-open "$news_link" &
	notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$articles_title" "Read complete article here") && [[ $notify == "open" ]] && xdg-open "$articles_link" &
	notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$podcasts_title" "Listen complete podcast here") && [[ $notify == "open" ]] && xdg-open "$podcasts_link" &
	notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$videos_title" "Watch complete video here") && [[ $notify == "open" ]] && xdg-open "$videos_link" &
fi

echo ""
