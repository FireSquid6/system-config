{ inputs, config, pkgs, ... }:

{
  # gtk
  gtk.enable = true;
  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk";

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";

  # qt
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";

  qt.style.package = pkgs.adwaita-qt;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
