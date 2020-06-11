#!/usr/bin/env bash
 
# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit
 
# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
 
# Launch Polybar, using default config location ~/.config/polybar/config
echo "---" | tee -a /tmp/polybar1.log
polybar --reload mainbar >> /tmp/polybar-main.log 2>&1 &

# Launch side bars if multiple monitors are connected
# FIXME: This does not respect ad-hoc connected monitors
for m in $(polybar --list-monitors | grep -v '(primary)' | cut -d":" -f1); do
    MONITOR=$m polybar --reload sidebar >> "/tmp/polybar-side-${m}.log" 2>&1 &
done

echo "Bars launched..."
