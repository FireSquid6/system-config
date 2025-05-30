{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags";
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
        ./systemModules/development.nix
        ./systemModules/boot.nix
        ./systemModules/nix-ld.nix
        ./systemModules/desktop.nix
        ./systemModules/games.nix

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
        ./systemModules/games.nix
        ./systemModules/development.nix
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
        ./systemModules/development.nix

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
        ./systemModules/development.nix
        ./systemModules/boot.nix
        ./systemModules/firesquid.nix

        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.liveIso = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      system = "x86_64-linux";
      modules = [
        (nixpkgs + "/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix")
        ./hosts/liveIso/configuration.nix
        ./systemModules/std.nix
        ./systemModules/firesquid.nix
        ./systemModules/server-desktop.nix

        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.vps = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/vps/hardware-configuration.nix
        ./hosts/vps/configuration.nix
        ./hosts/vps/networking.nix
        ./systemModules/std.nix
        ./systemModules/virtualization.nix
        ./systemModules/firesquid-headless.nix
        ./systemModules/nginx.nix

        inputs.home-manager.nixosModules.default
      ];
    };

    nixosConfigurations.wsl = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/wsl/configuration.nix
        ./systemModules/std.nix
        ./systemModules/firesquid-headless.nix

        inputs.nixos-wsl.nixosModules.default {
          wsl.enable = true;
        }

        inputs.home-manager.nixosModules.default
      ];
    };

    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        bun
        typescript
        gcc
        python3
      ];
    };
  };
}
