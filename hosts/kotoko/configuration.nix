{ config, pkgs, callPackage, inputs, ...}:

{
  imports = [
    systemModules/std.nix
    systemModules/firesquid.nix
    systemModules/desktop.nix
    systemModules/games.nix
  ];

  networking.hostName = "kotoko";
}
