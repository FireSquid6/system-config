{ inputs, config, pkgs, ... }:

{
  imports = [
    ../homeModules/common.nix
    ../homeModules/desktop.nix
  ];
}
