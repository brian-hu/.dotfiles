#!/usr/bin/zsh

DIR="$HOME/.config/polybar"

# Launch the bar
launch-bar () {
    # Terminate already running bar instances
    killall -q polybar

    # Wait until the processes have been shut down
    while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        if [ $m = "DP-0" ]; then
            POLYBAR_MONITOR=$m polybar --reload main -c "$DIR"/"$style"/config.ini &
        else
            POLYBAR_MONITOR=$m polybar --reload secondary -c "$DIR"/"$style"/config.ini &
        fi
    done
}
style="rounded"
launch-bar
