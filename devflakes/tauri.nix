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
        bun
        nodejs_20
        flyctl
        typescript

        at-spi2-atk
        atkmm
        cairo
        gdk-pixbuf
        glib
        gtk3
        harfbuzz
        librsvg
        libsoup_3
        pango
        webkitgtk_4_1
        openssl
        rustc
      ];
    nativeBuildInputs = with pkgs; [
        pkg-config
        gobject-introspection
        cargo
        cargo-tauri
        nodejs
      ];
    };
  };
}
