#!/bin/sh

HOSTNAME=$(hostname)

sudo nixos-rebuild switch --flake path:///etc/nixos/#$HOSTNAME
