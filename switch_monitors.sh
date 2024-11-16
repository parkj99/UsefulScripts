#!/bin/bash

##!! the claire option was for baldurs gate mirroring. anyways this doesnt work but manually doing wl-mirror works and is easy enough
switch_to_triple() {
    swaymsg "output HDMI-A-1 enable"
    swaymsg "output HDMI-A-1 resolution 1920x1080 position 5120,0"
    swaymsg "output DP-5 enable"
    swaymsg "output DP-5 resolution 2560x1440 position 0,0"
    swaymsg "output DP-4 enable"
    swaymsg "output DP-4 resolution 2560x1440 position 2560,0"
}

switch_to_single() {
    swaymsg "output HDMI-A-1 disable"
    swaymsg "output DP-4 disable"
    swaymsg "output DP-5 enable"
    swaymsg "output DP-5 resolution 2560x1440 position 0,0"
}

switch_to_double() {
    swaymsg "output HDMI-A-1 enable"
    swaymsg "output HDMI-A-1 resolution 1920x1080 position 2560,0"
    swaymsg "output DP-4 enable"
    swaymsg "output DP-4 resolution 2560x1440 position 0,0"
    swaymsg "output DP-5 disable"
}
switch_to_claire() {
    swaymsg "output DP-4 disable"
    swaymsg "output DP-5 disable"
    swaymsg "output HDMI-A-1 disable"
    swaymsg "output DP-4 enable"
    swaymsg "output DP-4 resolution 2560x1440 position 0,0"
    swaymsg "output HDMI-A-1 enable"
    swaymsg "output HDMI-A-1 resolution 1920x1080 position 2560,0"
    swaymsg "exec wl-mirror DP-5"
}

switch_to_gaming() {
    swaymsg "output DP-4 disable"
    swaymsg "output DP-5 disable"
    swaymsg "output HDMI-A-1 disable"
    swaymsg "output DP-4 enable"
    swaymsg "output DP-4 resolution 2560x1440 position 0,0"
}

case "$1" in
    triple)
        switch_to_triple
        ;;
    double)
        switch_to_double
        ;;
    single)
        switch_to_single
        ;;
    claire)
        switch_to_claire
        ;;
    gaming)
        switch_to_gaming
        ;;
    *)
        echo "Usage: $0 {triple|double|single|claire|gaming}"
        exit 1
        ;;
esac
