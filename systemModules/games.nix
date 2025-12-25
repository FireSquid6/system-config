{ inputs, config, pkgs, ...}:

{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };


  environment.systemPackages = with pkgs; [
    _2048-in-terminal
    prismlauncher

    # needed for minecraft
    # zulu
    # zulu17
    # zulu8

    modrinth-app
  ];
}
