{ inputs, config, pkgs, ...}:


{
  services.xserver = {
    enable = true;
    # xkb.layout = "us";
    # xkb.varient = "";
  };


  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };


  environment.systemPackages = with pkgs; [
    alacritty
    tmux
    lazygit
    lazydocker

    nodejs_20
    python3
    python311Packages.pip
  ];

}
