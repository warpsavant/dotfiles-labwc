#!/usr/bin/env bash

if [[ x"$@" == x"Power Off" ]]; then
	systemctl poweroff
elif [[ x"$@" == x"Reboot" ]]; then
	systemctl reboot
elif [[ x"$@" == x"Lock" ]]; then
	swaylock
	exit 0
elif [[ x"$@" == x"Suspend" ]]; then
	systemctl suspend
	exit 0
elif [[ x"$@" == x"Log Out" ]]; then
	case $XDG_CURRENT_DESKTOP in
		sway  ) swaymsg exit ;;
		labwc ) labwc -e ;;
	esac
fi

echo -en "Power Off\0icon\x1fsystem-shutdown\n"
echo -en "Reboot\0icon\x1fsystem-reboot\n"
echo -en "Lock\0icon\x1fsystem-lock-screen\n"
echo -en "Suspend\0icon\x1fsystem-suspend\n"
echo -en "Log Out\0icon\x1fsystem-log-out\n"
