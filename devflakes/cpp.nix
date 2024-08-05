
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  outputs = { self, nixpkgs }: 
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux; 
  in { 
    devShells.x86_64-linux.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        cmake
        ninja
        nodejs_20 # optional. Needed for me for copilot
        bear
        libgcc
        llvmPackages_17.libcxxClang
        ccls
      ];
    };
  };
}
