# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.firesquid = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; 
    initialPassword = "1234";  # this is not my real password. Nice try hackers!
  };

  environment.systemPackages = with pkgs; [
    git
    neovim
  ];

  system.stateVersion = "24.11";
}
