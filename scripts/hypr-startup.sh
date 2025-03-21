#!/usr/bin/env bash

/etc/nixos/scripts/tmux-startup.sh

hyprpaper &
/etc/nixos/scripts/waybar.sh &
nm-applet &
insync start

hyprctl setcursor Google-DotBlack 24

trayscale &
