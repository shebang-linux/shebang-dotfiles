#!/usr/bin/sh

usb_print() {
    devices=$(lsblk -Jplno NAME,RM,MOUNTPOINT)

    output=""

    for mounted in $(echo -e "$devices" | jq -r '.blockdevices[] | select(.rm == true) | select(.mountpoint != null) | .name'); do
        output="\uf052"
    done

    for unmounted in $(echo -e "$devices" | jq -r '.blockdevices[] | select(.rm == true) | select(.mountpoint == null) | .name'); do
        output="\uf052"
    done

    echo -e "$output"
}

case "$1" in
    --eject)
        devices=$(lsblk -Jplno NAME,RM,MOUNTPOINT)

        for unmount in $(echo "$devices" | jq -r '.blockdevices[] | select(.rm == true) | select(.mountpoint != null) | .name'); do
            udisksctl unmount --no-user-interaction -b "$unmount"
            udisksctl power-off --no-user-interaction -b "$unmount"
        done
        ;;
    *)
        usb_print
        ;;
esac
