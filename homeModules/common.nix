{ inputs, config, pkgs, ... }:

{
  imports = [ ];

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

  home.file = {
    ".vimrc".source = ../dotfiles/vimrc;
    ".bashrc".source = ../dotfiles/bashrc;
    ".tmux.conf".source = ../dotfiles/tmux.conf;
    ".config/betterlockscreen/betterlockscreenrc".source = ../dotfiles/betterlockscreenrc;
    ".config/dunst/dunstrc".source = ../dotfiles/dunstrc;
    ".config/i3/config".source = ../dotfiles/i3;
    ".config/kitty/kitty.conf".source = ../dotfiles/kitty.conf;
    ".config/lazygit/config.yml".source = ../dotfiles/lazygit.yml;
    ".config/picom/picom.conf".source = ../dotfiles/picom.conf;
    ".config/polybar/config.ini".source = ../dotfiles/polybar.ini;
    ".profile".source = ../dotfiles/profile;
    ".config/rofi/config.rasi".source = ../dotfiles/rofi.rasi;
    ".config/starship.toml".source = ../dotfiles/starship.toml;
    ".config/waybar/config.jsonc".source = ../dotfiles/waybar.jsonc;
    ".config/waybar/style.css".source = ../dotfiles/waybar.css;
    ".config/hypr/hyprland.conf".source = ../dotfiles/hyprland.conf;
    ".config/hypr/hyprlock.conf".source = ../dotfiles/hyprlock.conf;
    ".config/hypr/hypridle.conf".source = ../dotfiles/hypridle.conf;
    ".config/hypr/hyprpaper.conf".source = ../dotfiles/hyprpaper.conf;
    ".config/fish/config.fish".source = ../dotfiles/config.fish;
    ".config/eww/eww.yuck".source = ../dotfiles/eww.yuck;
    ".config/eww/eww.scss".source = ../dotfiles/eww.scss;
    ".config/alacritty/alacritty.toml".source = ../dotfiles/alacritty.toml;
    ".config/ink-nvim" = {
      source = ../ink-nvim;
      recursive = true;
    };
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
