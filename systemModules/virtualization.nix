
{ config, pkgs, callPackage, inputs, self, ...}:

{
  virtualisation.docker.enable = true;

  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    multipass
  ];
  
}
