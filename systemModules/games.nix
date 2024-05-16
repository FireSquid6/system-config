{ inputs, config, pkgs, ...}:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [
    _2048-in-terminal
    waydroid
    gnome.atomix
  ];
}
