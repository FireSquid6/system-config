with (import <nixpkgs> { });
mkShell {
  buildInputs = [
    nodejs_20
    bun
    python3
    libgcc
    lua
    lua-language-server
    nodePackages.typescript-language-server
  ];
}
