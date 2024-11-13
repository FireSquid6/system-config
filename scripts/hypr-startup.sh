#!/usr/bin/env bash

hyprpaper &
/etc/nixos/scripts/waybar.sh &
nm-applet &
/etc/nixos/scripts/tmux-startup.sh

hyprctl setcursor Google-DotBlack 24
