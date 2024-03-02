#!/bin/sh

notify-send "Rebuilding Dotfiles"
cd ~/source/dotcopy/
go run . build
