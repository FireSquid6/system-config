#!/usr/bin/env bash


swww init &
swww img ~/wallpapers/math.png &

setxkbmap -option caps:escape

/etc/nixos/scripts/waybar.sh &

