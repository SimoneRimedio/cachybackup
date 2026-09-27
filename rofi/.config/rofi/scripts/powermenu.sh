#!/usr/bin/env bash

options="\uf011  Shutdown\n\uf021  Reboot\n\uf2f5  Logout\n\uf186  Suspend"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power menu" -theme ~/.config/rofi/powermenu.rasi)

case "$chosen" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *Logout) i3-msg exit ;;
    *Suspend) systemctl suspend ;;
esac
