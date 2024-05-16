{ inputs, config, pkgs, ...}:

{
  users.users.firesquid = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "firesquid";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      font-manager

    ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "firesquid" = import ./home.nix;
    };
  };
}
