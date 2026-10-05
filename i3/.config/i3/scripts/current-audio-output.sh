#!/bin/bash

CARD="alsa_card.pci-0000_0c_00.4"

CURRENT=$(pactl list cards | awk -v card="$CARD" '
  $0 ~ "Name: "card {found=1}
  found && /Active Profile:/ {print $3; exit}
')

if [ "$CURRENT" = "output:analog-stereo+input:analog-stereo" ]; then
    echo "󰋋 Cuffie"
else
    echo "󰓃 Subwoofer"
fi
