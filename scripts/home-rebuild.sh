#!/bin/sh
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_INSECURE=1

HOSTNAME=$(hostname)

home-manager switch -f "/etc/nixos/hosts/$HOSTNAME/home.nix"
