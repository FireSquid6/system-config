#!/bin/sh
export NIXPKGS_ALLOW_UNFREE=1
export NIXPKGS_ALLOW_INSECURE=1

echo "Rebuilding home-manager configuration for $(whoami)"

home-manager switch -f "/etc/nixos/homeConfigurations/$(whoami).nix"
