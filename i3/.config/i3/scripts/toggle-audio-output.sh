#!/bin/bash

CARD="alsa_card.pci-0000_0c_00.4"
SINK_JACK="alsa_output.pci-0000_0c_00.4.analog-stereo"
SINK_SPDIF="alsa_output.pci-0000_0c_00.4.iec958-stereo"

CURRENT=$(pactl list cards | awk -v card="$CARD" '
  $0 ~ "Name: "card {found=1}
  found && /Active Profile:/ {print $3; exit}
')

if [ "$CURRENT" = "output:analog-stereo+input:analog-stereo" ]; then
    pactl set-card-profile "$CARD" output:iec958-stereo
    sleep 0.5
    pactl set-default-sink "$SINK_SPDIF"
else
    pactl set-card-profile "$CARD" output:analog-stereo+input:analog-stereo
    sleep 0.5
    pactl set-default-sink "$SINK_JACK"
fi

killall -SIGUSR1 i3status-rs
