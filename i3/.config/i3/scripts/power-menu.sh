#!/bin/bash

ICON_POWER=$'\uf011'
ICON_RESTART=$'\uf021'
ICON_SLEEP=$'\uf186'

i3-nagbar -f "pango:JetBrainsMono Nerd Font 11" -t warning -m "Cosa vuoi fare?" \
    -b "$ICON_POWER  Spegni" "systemctl poweroff" \
    -b "$ICON_RESTART  Riavvia" "systemctl reboot" \
    -b "$ICON_SLEEP  Sospendi" "systemctl suspend"
