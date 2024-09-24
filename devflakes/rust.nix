{
  description = "";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsFor = nixpkgs.legacyPackages;
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages = forAllSystems (system: {
        default = pkgs.rustPlatform.buildRustPackage rec {
          pname = "";
          version = "";
          cargoLock.lockFile = ./Cargo.lock;
          src = pkgs.lib.cleanSource ./.;
        };
      });
      devShells = forAllSystems (system: {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            cargo
            rustc
            rust-analyzer
            rustfmt
          ];
        };
      });
    };
}

