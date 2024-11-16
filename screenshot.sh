#!/bin/bash

# Function to take a screenshot of a selected region
screenshot_region() {
    grim -g "$(slurp)" - | wl-copy
    notify-send "Screenshot" "Region screenshot copied to clipboard"
}

####!!!!! This screenshot of window part doesn't work. too lazy to figure out why. Screenshot region still works
# Function to take a screenshot of the active window
screenshot_window() {
    active_window=$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
    grim -g "$active_window" - | wl-copy
    notify-send "Screenshot" "Active window screenshot copied to clipboard"
}

# Use bemenu to present options
choice=$(echo -e "Region\nActive Window" | bemenu -p "Screenshot:")

case "$choice" in
    "Region")
        screenshot_region
        ;;
    "Active Window")
        screenshot_window
        ;;
    *)
        notify-send "Screenshot" "Cancelled"
        ;;
esac

