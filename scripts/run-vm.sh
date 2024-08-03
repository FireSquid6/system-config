#!/usr/bin/env bash

NAME=$1

if [ -z "$NAME" ]; then
  echo "Usage: $0 <name>"
  exit 1
fi

FILEPATH="/etc/nixos/vm-configs/$NAME.nix"

nix-build '<nixpkgs/nixos>' -A vm -I nixpkgs=channel:nixos-23.11 -I nixos-config=$FILEPATH

QUEMY_KERNEL_PARAMS=console=ttyS0 ./result/bin/run-nixos-vm -nographic; reset
