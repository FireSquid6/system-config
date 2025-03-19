#!/usr/bin/env bash

hyprpaper &
trayscale &
/etc/nixos/scripts/waybar.sh &
nm-applet &
/etc/nixos/scripts/tmux-startup.sh
insync start

hyprctl setcursor Google-DotBlack 24
