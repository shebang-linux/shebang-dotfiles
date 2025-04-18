#!/usr/bin/sh

updates() {
        doas pacman -Syw >/dev/null
        list_upgradeable=$(doas pacman -Qu | wc -l)
        if [ "$list_upgradeable" -gt "0" ]; then
            echo "[u]"
        else
            echo ''
        fi
}

upgrade() {
    $(xterm -e 'doas pacman -Syyuu --needed --disable-download-timeout;doas flatpak uninstall --delete-data --unused -y;doas flatpak update -y;doas fwupdtool refresh --force;doas fwupdtool update' && polyrestart)
    updates
}

case "$1" in
    --upgrade)
        upgrade
        ;;
    *)
        updates
        ;;
esac
