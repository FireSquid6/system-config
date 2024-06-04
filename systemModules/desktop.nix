{ inputs, config, pkgs, ...}:

{
  xdg.portal.enable = true;
  xdg.portal.config.common.default = "gtk";

  xdg.mime.defaultApplications = {
    "text/html" = "firefox.desktop";
    "image/gif" = "firefox.desktop";
    "image/png" = "firefox.desktop";
    "image/jpeg" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
    "x-scheme-handler/about" = "firefox.desktop";
    "x-scheme-handler/unknown" = "firefox.desktop";
    "text/plain" = "neovide.desktop";
  };
  xdg.mime.enable = true;

  sound.enable = true;
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.support32Bit = true;

  virtualisation.virtualbox.host.enable = true;

  qt = {
    enable = true;
    platformTheme = "gnome";
    style = "adwaita-dark";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  hardware.keyboard.zsa.enable = true;

  services.xserver = {
    enable = true;

    displayManager = {
      defaultSession = "hyprland"; 
      gdm.enable = true;
    };

    desktopManager.gnome.enable = true;

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
    (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )

    xclip
    playerctl
    brightnessctl
    feh
    xss-lock
    libnotify
    wl-clipboard

    hyprlock
    hyprcursor
    hyprshot
    hyprpaper
    hypridle
    xdg-desktop-portal-hyprland

    discord
    chromium
    libresprite
    inkscape
    krita
    vlc
    thunderbird
    freecad
    guvcview
    youtube-music
    obsidian

    godot_4
    vscode
    tmux
    asciinema
    neovide
    lazydocker
    starship
    kitty
    alacritty
    lazygit

    nodejs_20
    python3
    python311Packages.pip

    dunst
    betterlockscreen
    waybar
    rofi-wayland
    picom
    polybar
    libsForQt5.sddm-kcm
    bluez5
    rofimoji
    eww

    gnome-icon-theme
    papirus-icon-theme

    grim
    wuzz
    flameshot
    simplescreenrecorder

    networkmanagerapplet
    blueberry

    pavucontrol
  ];

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    elisa
    gwenview
    okular
    oxygen
    khelpcenter
    konsole
    plasma-browser-integration
    print-manager
  ];

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  fonts.packages = with pkgs; [
    fira-code
    noto-fonts
    (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hasklig" "JetBrainsMono" "GeistMono" ]; })
  ];
}
