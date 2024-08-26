{ inputs, config, pkgs, ...}:

{
  # stuff I need for school
  environment.systemPackages = with pkgs; [
    teams # gayass school requires microsft fucking teams
    eclipses.eclipse-cpp
  ];
}
