{ inputs, config, pkgs, ...}:

{
  imports = [
    ./firesquid-common.nix
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "firesquid" = import ../homeConfigurations/fireadmin.nix;
    };
  };
}
