#!/usr/bin/sh

updates() {
        doas pacman -Syw &>/dev/null
        list_upgradeable=$(doas pacman -Qu | wc -l)
        if [ "$list_upgradeable" -gt "0" ]; then
            echo "[u]"
        else
            echo ""
        fi
}

upgrade() {
    $(xterm -e 'doas pacman -Syy --needed --noconfirm --disable-download-timeout archlinux-keyring artix-keyring;doas pacman -Suu --needed --disable-download-timeout;doas flatpak uninstall --delete-data --unused -y;doas flatpak update -y;doas fwupdmgr refresh --assume-yes --force;doas fwupdmgr update --assume-yes --force;doas killall fwupd';polyrestart)
}

case "$1" in
    --upgrade)
        upgrade
        ;;
    *)
        updates
        ;;
esac
