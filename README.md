# Nvim config with Nixvim

## Structure

```
├── config
│   ├── default.nix      
│   ├── diagnostics.nix             # diag related options
│   ├── opts.nix                    # main vim options and globals (vim.o vim.g)
│   └── plugins
│       ├── extra.nix               # for plugins not currently in nixvim
│       ├── lazy.nix                # lazy plugins
│       ├── lsp.nix                 # lsp/treesitter related plugins
│       └── plugins.nix             # the rest
├── flake.lock
├── flake.nix
└── README.md
```

## Test this config (all you need is nix)

To test this configuration simply run the following command

```
nix run github:FabioCastroMorffi/nvim-flake
```

## Sources

- This short and to the point gist by siph: [Building a standalone nixvim configuration](https://gist.github.com/siph/288b7c6b5f68a1902d28aebc95fde4c5)

- Of course, the documentation [Standalone Usage](https://nix-community.github.io/nixvim/platforms/standalone.html)
