{ inputs, config, pkgs, ...}:

{
  imports = [
    ./firesquid-common.nix
  ];

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs; };
    users = {
      "firesquid" = import ../homeConfigurations/fireadmin.nix;
    };
  };
}
