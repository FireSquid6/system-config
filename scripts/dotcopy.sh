#!/bin/sh


cp /etc/nixos/dotfiles/bashrc ~/.bashrc
cp /etc/nixos/dotfiles/dunstrc ~/.config/dunst/dunstrc
cp /etc/nixos/dotfiles/i3 ~/.config/i3/config
cp /etc/nixos/dotfiles/kitty.conf ~/.config/kitty/kitty.conf
cp /etc/nixos/dotfiles/picom.conf ~/.config/picom/picom.conf
cp /etc/nixos/dotfiles/lazygit.yml ~/.config/lazygit/config.yml
cp /etc/nixos/dotfiles/maestral.ini ~/.config/maestral/maestral.ini
cp /etc/nixos/dotfiles/rofi.rasi ~/.config/rofi/config.rasi
cp /etc/nixos/dotfiles/starship.toml ~/.config/starship.toml
cp /etc/nixos/dotfiles/polybar.ini ~/.config/polybar/config.ini
cp /etc/nixos/dotfiles/vimrc ~/.vimrc

i3-msg restart
