#!/usr/bin/bash

option="$(wofi -L 6 -l 3 -W 100 -y 10 --show=dmenu << EOF | sed 's/^ *//'
Shutdown
Reboot
Sleep
Lock
Logoff
Cancel
EOF)"

echo $option

case $option in
	Shutdown)
		systemctl poweroff
		;;
	Reboot)
		systemctl reboot
		;;
	Sleep)
		systemctl suspend
		;;
	Lock)
		hyprlock
		;;
	Logoff)
		hyprctl dispatch exit
		;;
esac

