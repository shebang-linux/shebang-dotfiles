#!/usr/bin/sh

_switch() {
	if [[ "$(ip link | grep 'state UP' | wc -l)" -gt 0 ]] && [[ "$(ip link | grep -E 'tun|ppp' | wc -l)" -eq 0 ]] && [[ "$(curl --user-agent 'noleak' -s https://check.torproject.org/api/ip | grep -E 'False|false')" ]]; then
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
		if [[ "$(ip link | grep 'state UP' | wc -l)" -gt 0 ]] && [[ "$(curl --user-agent 'noleak' -s https://check.torproject.org/api/ip | grep -E 'True|true')" ]]; then
			echo -e "\uf023"
		elif [[ "$(ip link | grep 'state UP' | wc -l)" -gt 0 ]] && [[ "$(ip link | grep -E 'tun|ppp' | wc -l)" -gt 0 ]]; then
			echo -e "\uf023"
		else
			echo -e "\uf13e"
		fi
		;;
esac
