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

  # old pulseaudio stuff
  # nixpkgs.config.pulseaudio = true;
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.support32Bit = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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


  services.displayManager = {
    defaultSession = "hyprland";
  };

  services.xserver = {
    enable = true;

    displayManager = {
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
    xclicker
    playerctl
    brightnessctl
    feh
    xss-lock
    libnotify
    wl-clipboard

    hyprlock
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

    alacritty

    betterlockscreen
    waybar
    rofi-wayland
    waypipe
    picom
    polybar
    libsForQt5.sddm-kcm
    rofimoji
    dunst

    gnome-icon-theme
    papirus-icon-theme

    grim
    wuzz
    flameshot
    simplescreenrecorder

    networkmanagerapplet
    pavucontrol
    pamixer

    bun
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
