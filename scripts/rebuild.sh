#!/bin/sh

HOSTNAME=$(hostname)
echo "Rebuilding configuration for $HOSTNAME"

sudo nixos-rebuild switch --flake path:///etc/nixos/#$HOSTNAME
