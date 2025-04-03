#!/usr/bin/env bash

CONFIGURATION=$1
if [ -z "$1" ] 
then 
  echo "No configuration specified, using hostname"
  CONFIGURATION=$(hostname)
fi

echo "Rebuilding configuration for $CONFIGURATION"
sudo nixos-rebuild switch --flake path://"$SYSTEM_CONFIG_DIR"/#"$CONFIGURATION"
