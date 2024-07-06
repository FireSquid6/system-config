{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs; mkShell {
  buildInputs = [
    nodejs_20
    libgcc
    solc
    llvmPackages_9.libcxxabi
    llvmPackages_17.libcxxClang
    ccls
  ];
}
