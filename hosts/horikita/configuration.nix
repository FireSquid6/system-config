{ config, pkgs, callPackage, inputs, ... }:

{
  networking.hostName = "horikita";

  # August 8 2024
  # workaround for some issues in pipewire that eat battery life
  # future me may want to remove this once it's patched
  services.pipewire = {
  enable = true;
  wireplumber = {
    enable = true;
    extraConfig = {
      "10-disable-camera" = {
        "wireplumber.profiles" = {
          main."monitor.libcamera" = "disabled";
        };
      };
    };
  };
};
}
