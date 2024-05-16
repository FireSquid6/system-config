{ config, pkgs, callPackage, inputs, ...}:

{
  services.logind = {
    lidSwitch = "suspend";
    lidSwitchDocked = "suspend";
    lidSwitchExternalPower = "suspend";
    powerKey = "poweroff";
  };
}
