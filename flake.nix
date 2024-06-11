{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    nixosConfigurations.kotoko = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/kotoko/hardware-configuration.nix
        ./hosts/kotoko/configuration.nix
        ./systemModules/std.nix
        ./systemModules/firesquid.nix
        ./systemModules/virtualization.nix
        ./systemModules/boot.nix
        ./systemModules/nix-ld.nix
        ./systemModules/desktop.nix

        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.horikita = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/horikita/hardware-configuration.nix
        ./hosts/horikita/configuration.nix
        ./systemModules/bluetooth.nix
        ./systemModules/lid.nix
        ./systemModules/virtualization.nix
        ./systemModules/std.nix
        ./systemModules/boot.nix
        ./systemModules/firesquid.nix
        ./systemModules/nix-ld.nix
        ./systemModules/desktop.nix

        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.rpi = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/rpi/hardware-configuration.nix
        ./hosts/rpi/configuration.nix
        ./systemModules/std.nix
        ./systemModules/rpi-boot.nix
        ./systemModules/firesquid.nix
        ./systemModules/server-desktop.nix
        ./systemModules/virtualization.nix

        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.megumin = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/megumin/hardware-configuration.nix
        ./hosts/megumin/configuration.nix
        ./systemModules/std.nix
        ./systemModules/virtualization.nix
        ./systemModules/boot.nix
        ./systemModules/firesquid.nix
        ./systemModules/server-desktop.nix

        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
