#!/bin/sh


title="title"
widthpercent=number

typeset -A menu
menu=(
    [  Projects]="kitty /home/firesquid/source"
    [  Lock]="/etc/nixos/scripts/lock.sh"
    [󰒲  Suspend]="systemctl suspend"
    [⏻  Shutdown]="shutdown -h now"
    [󰍃  Logout]="i3-msg exit"
    [  Wifi Settings]="/etc/nixos/scripts/wifi-menu.sh"
    [󰌙  Disconnect]="/etc/nixos/scripts/disconnect.sh"
    [󰌘  Connect]="/etc/nixos/scripts/connect.sh"
)
menu_nrows=${#menu[@]}
