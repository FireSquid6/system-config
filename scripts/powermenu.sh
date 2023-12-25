#!/bin/sh


title="title"
widthpercent=number

typeset -A menu
menu=(
    [  Projects]="kitty /home/firesquid/source"
    [  Lock]="/home/firesquid/scripts/lock.sh"
    [󰒲  Suspend]="systemctl suspend"
    [⏻  Shutdown]="shutdown -h now"
    [󰃢  Organize]="/home/firesquid/scripts/negtd"
)
menu_nrows=${#menu[@]}
