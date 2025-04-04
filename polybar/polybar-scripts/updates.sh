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
    $(xterm -e 'doas pacman -Syyuu --needed --disable-download-timeout;doas flatpak uninstall --delete-data --unused -y;doas flatpak update -y;doas fwupdmgr get-devices;doas fwupdmgr refresh --force;doas fwupdmgr get-updates -y;doas fwupdmgr update -y' && polyrestart)
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
