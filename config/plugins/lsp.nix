{
  pkgs,
  lib,
  config,
  ...
}:
let
  cppConfig = [
    {
      name = "Launch file";
      type = "lldb";
      request = "launch";
      program = {
        __raw = ''
          function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end
        '';
      };
      cwd = "\${workspaceFolder}";
      stopOnEntry = false;
    }
  ];
in
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
          extraOptions = {
            cmd = [
              "clangd"
              "--background-index"
              "--clang-tidy"
              "--header-insertion=iwyu"
            ];
          };
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

    dap-ui.enable = true;
    dap-virtual-text.enable = true;
    dap = {
      enable = true;
      autoLoad = true;

      adapters = {
        executables = {
          lldb = {
            command = "${lib.getExe' pkgs.lldb "lldb-dap"}";
          };
        };
      };

      configurations = {
        cpp = cppConfig;
        rust = cppConfig;
        c = cppConfig;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>lua require('dap').continue()<CR>";
      options = {
        desc = "DAP Continue";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
      options = {
        desc = "DAP Toggle Breakpoint";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dsi";
      action = "<cmd>lua require('dap').step_into()<CR>";
      options = {
        desc = "DAP Step Into";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>dso";
      action = "<cmd>lua require('dap').step_over()<CR>";
      options = {
        desc = "DAP Step Out/Over";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>du";
      action = "<cmd>lua require('dapui').toggle()<CR>";
      options = {
        desc = "DAP UI Toggle";
        silent = true;
      };
    }
  ];

  extraPackages = with pkgs; [
    clang-tools
    lldb
  ];
}
