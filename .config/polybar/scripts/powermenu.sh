#!/bin/bash

MENU="$(rofi -no-lazy-grab -sep "|" -dmenu -i -p 'System :' \
-hide-scrollbar true \
-lines 3 \
-width 15 \
-xoffset 0 -yoffset 24 \
-location 3 \
<<< ">> Lock|>> Reboot|>> Shutdown")"
case "$MENU" in
  *Lock) dm-tool lock ;;
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl -i poweroff
esac
