{
  plugins = {
    web-devicons.enable = true;

    gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {
            text = "+";
          };
          change = {
            text = "~";
          };
          delete = {
            text = "_";
          };
          topdelete = {
            text = "‾";
          };
          changedelete = {
            text = "~";
          };
        };
      };
    };

    which-key = {
      enable = true;
      settings = {
        delay = 0;
        icons.mappings = true;
        spec = [
          {
            __unkeyed-1 = "<leader>s";
            group = "[S]earch";
            mode = [
              "n"
              "v"
            ];
          }
          {
            __unkeyed-1 = "<leader>t";
            group = "[T]oggle";
          }
          {
            __unkeyed-1 = "<leader>h";
            group = "Git [H]unk";
            mode = [
              "n"
              "v"
            ];
          }
          {
            __unkeyed-1 = "gr";
            group = "LSP Actions";
            mode = [ "n" ];
          }
        ];
      };
    };

    todo-comments = {
      enable = true;
      settings.signs = false;
    };

    guess-indent = {
      enable = true;
    };

    auto-session = {
      enable = true;
    };

    fidget = {
      enable = true;
    };

    snacks = {
      enable = true;
      settings = {
        input.enabled = true;
        picker.enabled = true;
      };
    };

    toggleterm = {
      enable = true;
      settings = {
        direction = "float";
        open_mapping.__raw = "[[<C-/>]]";
        float_opts.border = "rounded";
      };
    };

    markview = {
      enable = true;
    };

    lz-n = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    conform-nvim = {
      enable = true;
      settings = {
        notify_on_error = true;
        format_on_save.__raw = ''
          function(bufnr)
            local enabled_filetypes = {
              -- lua = true,
            }
            if enabled_filetypes[vim.bo[bufnr].filetype] then
              return { timeout_ms = 500 }
            end
            return nil
          end
        '';
        default_format_opts.lsp_format = "fallback";
        formatters_by_ft = {
          nix = [ "nixfmt" ];
          lua = [ "stylua" ];
          rust = [ "rustfmt" ];
          python = [ "black" ];
          html = [ "prettier" ];
          markdown = [ "prettier" ];
          c = [ "clang_format" ];
          cpp = [ "clang_format" ];
        };
      };
    };

  };

  colorschemes = {

    tokyonight = {
      enable = true;
      settings.styles.comments.italic = false;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>lg";
      action = "<cmd>LazyGit<CR>";
      options.desc = "LazyGit";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>f";
      action.__raw = ''
        function()
          require("conform").format({ async = true })
        end
      '';
      options.desc = "[F]ormat buffer";
    }
  ];
}
