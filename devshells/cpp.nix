{ pkgs ? import <nixpkgs> { } }:

with pkgs;
pkgs.stdenv.mkDerivation {
  name = "c++ development";
  buildInputs = [
    cmake
    ninja
    nodejs_20 # optional. Needed for me for copilot
    bear
    libgcc
    llvmPackages_17.libcxxClang
    ccls
  ];
}
