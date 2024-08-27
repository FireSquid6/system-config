{ inputs, config, pkgs, ...}:

{
  # stuff I need for school
  environment.systemPackages = with pkgs; [
    eclipses.eclipse-cpp
    obs-studio
    libsForQt5.okular
  ];
}
