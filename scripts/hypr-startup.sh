#!/usr/bin/env bash

/etc/nixos/scripts/tmux-startup.sh
hypridle &
/etc/nixos/scripts/waybar.sh &
nm-applet &
