#!/usr/bin/sh

bluetooth_print() {
    if [ "$(lsusb | grep -i Bluetooth)" ] || [ "$(lsmod | grep -i Bluetooth)" ]; then
	if [ "$(rfkill | grep -i Bluetooth | grep -o unblocked | wc -l)" -ge 2 ]; then
		bluetoothctl | while read -r; do
			if bluetoothctl show | grep -q "Powered: yes"; then
				echo -e ""
				devices_paired=$(bluetoothctl devices | grep -i Device | cut -d ' ' -f 2)
				echo -e "$devices_paired" | while read -r line; do
					bluetoothctl connect "$line" >/dev/null
					device_info=$(bluetoothctl info "$line")
					if echo -e "$device_info" | grep -q "Connected: yes"; then
						device_output=$(echo -e "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
						echo -e "  $device_output "
					fi
				done
			else
				echo -e ""
			fi
		done
	else
		echo -e ""
	fi
    else
        echo ""
    fi
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >/dev/null
        devices_paired=$(bluetoothctl devices | grep -i Device | cut -d ' ' -f 2)
        echo -e "$devices_paired" | while read -r line; do
            bluetoothctl connect "$line" >/dev/null
        done
    else
        devices_paired=$(bluetoothctl devices | grep -i Device | cut -d ' ' -f 2)
        echo -e "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >/dev/null
        done
        bluetoothctl power off >/dev/null
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
