{ inputs, config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    gdb
    lazygit
    lazydocker
    cloc
    fh
    direnv

    godot_4
    vscodium
    asciinema
    neovide
    starship

    arduino
    arduino-ide

    bash-language-server
    statix
    marksman
    htmx-lsp
    tailwindcss-language-server
    pyright
    rust-analyzer
    lua-language-server
    gopls
    elixir-ls
    ccls
    nodePackages.typescript-language-server
    arduino-language-server
    nixfmt-classic

    nodejs_20
    python3
    python311Packages.pip
    bun


  ];
}
