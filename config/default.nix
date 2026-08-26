{
  # Import all your configuration modules here
  imports = [
    ./opts.nix
    ./diagnostics.nix
    ./plugins/plugins.nix
    ./plugins/lazy.nix
    ./plugins/extra.nix
    ./plugins/lsp.nix
  ];
}
