with (import <nixpkgs> { });
mkShell {
  buildInputs = [
    rustc
    nodejs_20
    bun
    python3
    libgcc
    lua
    go
    ruby
    elixir_1_14
  ];
}
