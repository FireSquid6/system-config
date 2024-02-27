{ config, pkgs, ... }:

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

  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.hello

    pkgs.libnotify

    pkgs.neofetch
    pkgs.discord
    pkgs.godot_4

    pkgs.lapce
    pkgs.asciinema

    pkgs.libresprite
    pkgs.inkscape
    pkgs.krita
    pkgs.vlc

    pkgs.prismlauncher
    pkgs.guvcview

    pkgs.vscode
    pkgs.neovide

    pkgs.chromium

    pkgs.rofimoji

    pkgs.betterlockscreen
    pkgs.youtube-music

    pkgs.tmux
    pkgs.obsidian
    pkgs.dunst
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # config.services.dunst = {
  #   enable = true;
  #
  #   settings = {
  #     global = {
  #       follow = "keyboard";
  #       markup = "full";
  #       dmenu = "${pkgs.rofi}/bin/rofi -dmenu -p dunst:";
  #     };
  #
  #     urgency_low.timeout = 5;
  #     urgency_normal.timeout = 10;
  #     urgency_critical.timeout = 15;
  #
  #     shortcuts = {
  #       context = "mod1+period";
  #       close = "mod1+space";
  #       close_all = "mod1+shift+space";
  #       history = "mod1+grave";
  #     };
  #   };
  # };

  programs.git = {
    enable = true;
    userName = "firesquid6";
    userEmail = "jdeiss06@gmail.com";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    # ".config/i3/config".source = dotfiles/i3;
    # ".config/kitty/kitty.conf".source = dotfiles/kitty.conf;
    # ".vimrc".source = dotfiles/vimrc;
    # ".bashrc".source = dotfiles/bashrc;
    # ".config/starship.toml".source = dotfiles/starship.toml;
    # ".config/rofi/config.rasi".source = dotfiles/rofi.rasi;
    # ".config/dunst/dunstrc".source = dotfiles/dunstrc;
    # ".config/lazygit/config.yml".source = dotfiles/lazygit.yml;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/firesquid/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox";
    TERMINAL = "kitty";
    VISUAL = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
