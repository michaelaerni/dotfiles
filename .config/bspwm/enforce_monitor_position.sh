#! /bin/sh

# Always swaps the monitor on the first position with the main one.
# Adapted from https://github.com/baskerville/bspwm/issues/679

MON_ID=$(bspc query -M -m "primary")
MON_POS='^1'

[ $(bspc query -M -m "$MON_POS") != "$MON_ID" ] && bspc monitor "$MON_POS" -s "$MON_ID"

bspc subscribe monitor_swap | while read msg ; do
	[ $(bspc query -M -m "$MON_POS") != "$MON_ID" ] && bspc monitor "$MON_POS" -s "$MON_ID"
done
