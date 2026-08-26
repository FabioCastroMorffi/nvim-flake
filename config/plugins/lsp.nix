{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        rust_analyzer = {
          enable = true;
        };
        clangd = {
          enable = true;
        };
        pyright = {
          enable = true;
        };
      };
    };

    treesitter = {
      enable = true;
      nixGrammars = true;
      grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
        lua
        nix
        rust
        c
        cpp
        python
        html
        markdown
        query
        vim
        vimdoc
      ];
      settings = {
        highlight.enable = true; # explicit, though likely already the default
        indent.enable = true; # this replaces your manual indentexpr-setting FileType block
      };
    };
  };
}
