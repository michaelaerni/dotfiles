#!/bin/bash

MENU="$(rofi -no-lazy-grab -sep "|" -dmenu -i -p 'System :' \
-hide-scrollbar true \
-me-select-entry '' -me-accept-entry 'MousePrimary' \
-lines 5 \
-width 15 \
-xoffset 0 -yoffset 24 \
-location 3 \
<<< ">> Lock|>> Sleep|>> Hibernate|>> Reboot|>> Shutdown")"
case "$MENU" in
  *Lock) dm-tool lock ;;
  *Sleep) systemctl suspend ;;
  *Hibernate) notify-send "Hibernate" "Hibernate is not configured and implemented yet" -a "Power Menu" ;; # TODO: Implement hibernate
  *Reboot) systemctl reboot ;;
  *Shutdown) systemctl -i poweroff
esac
