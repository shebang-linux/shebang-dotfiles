#!/usr/bin/sh

_switch() {
	if [[ "$(ip link | grep 'UP mode' | wc -l)" -gt 0 ]] && [[ "$(curl -s https://check.torproject.org/api/ip | grep -e 'False' -e 'false')" ]]; then
		doas /root/.local/bin/tor-router start
	else
		doas /root/.local/bin/tor-router stop
	fi
}

case "$1" in
	switch)
		_switch
		;;
	*)
		if [[ "$(ip link | grep 'UP mode' | wc -l)" -gt 0 ]] && [[ "$(curl -s https://check.torproject.org/api/ip | grep -e 'True' -e 'true')" ]]; then
			echo -e "\uf023"
		else
			echo -e "\uf13e"
		fi
		;;
esac
