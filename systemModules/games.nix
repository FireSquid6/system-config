{ inputs, config, pkgs, ...}:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };


  environment.systemPackages = with pkgs; [
    _2048-in-terminal
    gnome.atomix
    prismlauncher
  ];
}
