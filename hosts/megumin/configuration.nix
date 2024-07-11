{ config, pkgs, callPackage, inputs, ...}:

{
  networking.hostName = "megumin";
  networking.firewall = {
    enable = false;
  }
}
