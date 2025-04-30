#!/usr/bin/env bash

CONFIGURATION=$1
if [ -z "$1" ] 
then 
  echo "No configuration specified, using hostname"
  CONFIGURATION=$(hostname)
fi

echo "Rebuilding configuration for $CONFIGURATION"
export NIXPKGS_ACCEPT_ANDROID_SDK_LICENSE=1
sudo nixos-rebuild switch --flake path://"$SYSTEM_CONFIG_DIR"/#"$CONFIGURATION"
