{ inputs, config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "firesquid";
  home.homeDirectory = "/home/firesquid";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  # gtk
  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.google-cursor;
  gtk.cursorTheme.name = "Black";

  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk";
  
  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";

  # qt
  qt.enable = true;
  qt.platformTheme = "gtk";
  qt.style.name = "adwaita-dark";

  qt.style.package = pkgs.adwaita-qt;


  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.

    # TERMINAL APPS
    pkgs.neofetch
    pkgs._2048-in-terminal
    pkgs.asciinema
    pkgs.tmux

    # DEVELOPMENT
    pkgs.lapce
    pkgs.godot_4
    pkgs.vscode
    pkgs.neovide
    pkgs.lazydocker
    pkgs.starship
    pkgs.kitty
    pkgs.alacritty
    pkgs.lazygit

    pkgs.nodejs_20
    pkgs.python3
    pkgs.python311Packages.pip

    # APPLICATIONS
    pkgs.discord
    pkgs.chromium
    pkgs.libresprite
    pkgs.inkscape
    pkgs.krita
    pkgs.vlc
    pkgs.thunderbird
    pkgs.freecad
    pkgs.guvcview
    pkgs.youtube-music
    pkgs.obsidian

    # DESKTOP
    pkgs.dunst
    pkgs.betterlockscreen
    pkgs.waybar
    pkgs.rofi-wayland
    pkgs.picom
    pkgs.polybar
    pkgs.libsForQt5.sddm-kcm
    pkgs.gnome-icon-theme
    pkgs.papirus-icon-theme
    pkgs.bluez5
    pkgs.rofimoji

    # SCREENSHOTS/RECORDING
    pkgs.grim
    pkgs.wuzz
    pkgs.flameshot
    pkgs.simplescreenrecorder
  ];


  programs.git = {
    enable = true;
    userName = "firesquid6";
    userEmail = "jdeiss06@gmail.com";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
