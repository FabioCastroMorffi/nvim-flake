{
  plugins = {
    web-devicons.enable = true;
    fugitive.enable = true;

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

    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "default";
        appearance.nerd_font_variant = "mono";
        completion.documentation = {
          auto_show = false;
          auto_show_delay_ms = 500;
        };
        sources.default = [
          "lsp"
          "path"
          "snippets"
        ];
        snippets.preset = "luasnip";
        fuzzy.implementation = "lua";
        signature.enabled = true;
      };
    };

    lualine = {
      enable = true;

      settings = {
        options = {
          theme = "auto";
          icons_enabled = true;
          component_separators = {
            left = "❯";
            right = "❮";
          };
          section_separators = {
            left = "";
            right = "";
          };
          globalstatus = true;
        };

        # Statusline component arrangement matching the image
        sections = {
          lualine_a = [ "mode" ]; # normal (blue powerline section)
          lualine_b = [ "branch" ]; # branch icon + master
          lualine_c = [
            "diff"
            "filename"
          ]; # +2 ~1 -1 | lualine.lua
          lualine_x = [
            "encoding"
            "fileformat"
            "filetype"
          ]; # utf-8 | unix icon | lua
          lualine_y = [ "progress" ]; # Top
          lualine_z = [ "location" ]; # 1:1 (blue powerline end section)
        };

        tabline = {
          lualine_a = [
            {
              __unkeyed-1 = "buffers";
              show_filename_only = true; # Like airline's unique_tail
              hide_filename_extension = false;
              show_modified_status = true;
              mode = 2; # 0: shows buffer numbers, 1: buffer index, 2: buffer name

              show_close_icon = false;
              max_length = {
                __raw = "function() return vim.o.columns end";
              };
            }
          ];
          lualine_z = [ "tabs" ]; # Shows tab pages on the far right if multiple exist
        };
      };
    };

  };

  colorschemes.rose-pine = {
    enable = true;
    settings = {
      variant = "main"; # "main", "moon", or "dawn"
      dark_variant = "main";
      styles = {
        bold = true;
        italic = false;
      };
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
