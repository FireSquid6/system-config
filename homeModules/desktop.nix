{ inputs, config, pkgs, ... }:

{
  # gtk
  gtk.enable = true;
  gtk.theme.package = pkgs.tokyonight-gtk-theme;
  gtk.theme.name = "tokyonight-gtk-theme";

  gtk.iconTheme.package = pkgs.papirus-icon-theme;
  gtk.iconTheme.name = "Papirus-Dark";

  # qt
  qt.enable = true;
  qt.platformTheme.name = "gtk";
  qt.style.name = "adwaita-dark";

  qt.style.package = pkgs.adwaita-qt;
}
