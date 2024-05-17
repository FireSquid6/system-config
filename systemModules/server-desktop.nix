{ inputs, config, pkgs, ...}:


{
  services.xserver = {
    enable = true;
    # xkb.layout = "us";
    # xkb.varient = "";

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3blocks
        i3lock-color
      ];
    };
  };


  environment.systemPackages = with pkgs; [
    alacritty
    xterm
    firefox
    tmux
    lazygit
    lazydocker

    nodejs_20
    python3
    python311Packages.pip
  ];
}
