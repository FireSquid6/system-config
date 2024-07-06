{ nixpkgs ? import <nixpkgs> { } }:
with nixpkgs; mkShell {
  buildInputs = [
    nodejs_20
    libgcc
  ];
}
