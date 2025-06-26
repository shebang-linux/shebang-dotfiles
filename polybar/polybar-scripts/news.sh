#!/usr/bin/sh

if [[ $(ip link | grep 'state UP' | wc -l) -gt 0 ]]; then
	news_feed=$(curl -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://simplifiedprivacy.com/index.xml)
	podcast_feed=$(curl -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://podcast.simplifiedprivacy.com/index.xml)
	video_feed=$(curl -s -H 'user-agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36' https://video.simplifiedprivacy.com/feed/)

	news_title=$(echo -e "$news_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR==1')
	news_link=$(echo -e "$news_feed" | xmlstarlet sel -t -m '//item' -v 'link' -n | awk 'NR==1')
	podcast_title=$(echo -e "$podcast_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR==1')
	podcast_link=$(echo -e "$podcast_feed" | xmlstarlet sel -t -m '//item' -v 'link' -n | awk 'NR==1')
	video_title=$(echo -e "$video_feed" | xmlstarlet sel -t -m '//item' -v 'title' -n | awk 'NR==1')
	video_link=$(echo -e "$video_feed" | xmlstarlet sel -t -m '//item' -v 'link' -n | awk 'NR==1')

	notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$news_title" "Read complete article here") && [[ $notify == "open" ]] && xdg-open "$news_link" &
	notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$podcast_title" "Listen complete podcast here") && [[ $notify == "open" ]] && xdg-open "$podcast_link" &
	notify=$(notify-send -u critical -i notification-message-im -A "open=Open URL" "$video_title" "Watch complete video here") && [[ $notify == "open" ]] && xdg-open "$video_link" &
fi

echo ""
