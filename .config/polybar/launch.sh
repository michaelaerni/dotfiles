#!/usr/bin/env bash
 
# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit
 
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
 
# Launch Polybar, using default config location ~/.config/polybar/config
echo "---" | tee -a /tmp/polybar1.log
polybar mainbar >> /tmp/polybar1.log 2>&1 &

echo "Bars launched..."
