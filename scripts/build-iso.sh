#!/bin/sh


nix run nixpkgs#nixos-generators -- --format iso --flake path:///etc/nixos/#liveIso -o result
