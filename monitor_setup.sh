#!/bin/bash

choice=$(echo -e "Triple Monitor\nDouble Monitor\nSingle Monitor" | bemenu -i -p "Select monitor setup:")

case "$choice" in
    "Triple Monitor")
        ~/.local/bin/switch_monitors.sh triple
        ;;
    "Single Monitor")
        ~/.local/bin/switch_monitors.sh single
        ;;
    "Double Monitor")
        ~/.local/bin/switch_monitors.sh double
        ;;
    *)
        exit 1
        ;;
esac
