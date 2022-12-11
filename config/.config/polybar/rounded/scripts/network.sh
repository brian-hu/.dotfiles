#!/bin/bash

network="$1"

data=$(nmcli | rg " connection" | wc -l)

if [[ "$data" = "0" ]]; then
    # Dracula
    # echo "%{F#bd93f8}睊 %{F#ffffff}Offline"
    # Gruvbox
    echo "%{F#8f3f71}睊 %{F#efdfb7}Offline"
else
    net=$(nmcli | rg " connection" | head -n 1 | awk '{print $4}')
    # Dracula
    # echo "%{F#bd93f8}直 %{F#ffffff}$net"
    # Gruvbox
    echo "%{F#8f3f71}直 %{F#efdfb7}$net"
fi
