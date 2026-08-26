{pkgs, ...}:
{
  plugins = {

    avante = {
      enable = true;
      settings = {
        input.provider = "snacks";
        selector.provider = "snacks";
      };
      lazyLoad.settings = {
        cmd = [
          "AvanteAsk"
          "AvanteChat"
          "AvanteToggle"
        ];
        keys = [
          {
            __unkeyed-1 = "<leader>aa";
            __unkeyed-2.__raw = "function() require('avante.api').ask() end";
            desc = "Avante Ask";
          }
        ];
      };
    };

    mini = {
      enable = true;
      modules = {
        pairs = { };
        ai = {
          mappings = {
            around_next = "aa";
            inside_next = "ii";
          };
          n_lines = 500;
        };
        surround = { };
        statusline = {
          use_icons = true;
        };
        tabline = {
          show_reorder = false;
          show_close = false;
          tabpage_section = "left";
        };
      };
    };

    telescope = {
      enable = true;
      lazyLoad.settings.keys = [
        "<leader>sh"
        "<leader>sk"
        "<leader>sf"
        "<leader>ss"
        "<leader>sw"
        "<leader>sg"
        "<leader>sd"
        "<leader>sr"
        "<leader>s."
        "<leader>sc"
        "<leader><leader>"
        "<leader>/"
        "<leader>s/"
        "<leader>sn"
      ];

      settings.defaults.mappings.i = {
        "<c-enter>".__raw = "\"to_fuzzy_refine\"";
        "<CR>".__raw = ''
          function(prompt_bufnr)
            local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local multi = picker:get_multi_selection()
            if not vim.tbl_isempty(multi) then
              require("telescope.actions").close(prompt_bufnr)
              for _, j in pairs(multi) do
                if j.path ~= nil then
                  vim.cmd(string.format("%s %s", "edit", j.path))
                end
              end
            else
              require("telescope.actions").select_default(prompt_bufnr)
            end
          end
        '';
      };

      settings.extensions."ui-select".__raw = "require('telescope.themes').get_dropdown()";

      extensions = {
        fzf-native.enable = true;
        ui-select.enable = true;
        file-browser.enable = true;
      };
    };


    luasnip = {
      enable = true;
      lazyLoad.settings.event = "InsertEnter";
    };

  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>sh";
      action.__raw = "function() require('telescope.builtin').help_tags() end";
      options.desc = "[S]earch [H]elp";
    }
    {
      mode = "n";
      key = "<leader>sk";
      action.__raw = "function() require('telescope.builtin').keymaps() end";
      options.desc = "[S]earch [K]eymaps";
    }
    {
      mode = "n";
      key = "<leader>sf";
      action.__raw = "function() require('telescope.builtin').find_files() end";
      options.desc = "[S]earch [F]iles";
    }
    {
      mode = "n";
      key = "<leader>ss";
      action.__raw = "function() require('telescope.builtin').builtin() end";
      options.desc = "[S]earch [S]elect Telescope";
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>sw";
      action.__raw = "function() require('telescope.builtin').grep_string() end";
      options.desc = "[S]earch current [W]ord";
    }
    {
      mode = "n";
      key = "<leader>sg";
      action.__raw = "function() require('telescope.builtin').live_grep() end";
      options.desc = "[S]earch by [G]rep";
    }
    {
      mode = "n";
      key = "<leader>sd";
      action.__raw = "function() require('telescope.builtin').diagnostics() end";
      options.desc = "[S]earch [D]iagnostics";
    }
    {
      mode = "n";
      key = "<leader>sr";
      action.__raw = "function() require('telescope.builtin').resume() end";
      options.desc = "[S]earch [R]esume";
    }
    {
      mode = "n";
      key = "<leader>s.";
      action.__raw = "function() require('telescope.builtin').oldfiles() end";
      options.desc = "[S]earch Recent Files (\".\" for repeat)";
    }
    {
      mode = "n";
      key = "<leader>sc";
      action.__raw = "function() require('telescope.builtin').commands() end";
      options.desc = "[S]earch [C]ommands";
    }
    {
      mode = "n";
      key = "<leader><leader>";
      action.__raw = "function() require('telescope.builtin').buffers() end";
      options.desc = "[ ] Find existing buffers";
    }
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = ''
        function()
          require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
          }))
        end
      '';
      options.desc = "[/] Fuzzily search in current buffer";
    }
    {
      mode = "n";
      key = "<leader>s/";
      action.__raw = ''
        function()
          require("telescope.builtin").live_grep({ grep_open_files = true, prompt_title = "Live Grep in Open Files" })
        end
      '';
      options.desc = "[S]earch [/] in Open Files";
    }
    {
      mode = "n";
      key = "<leader>sn";
      action.__raw = ''
        function()
          require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
        end
      '';
      options.desc = "[S]earch [N]eovim files";
    }
  ];

  extraConfigLua = ''
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
      callback = function(event)
        local builtin = require("telescope.builtin")
        local buf = event.buf
        vim.keymap.set("n", "grr", builtin.lsp_references, { buffer = buf, desc = "[G]oto [R]eferences" })
        vim.keymap.set("n", "gri", builtin.lsp_implementations, { buffer = buf, desc = "[G]oto [I]mplementation" })
        vim.keymap.set("n", "grd", builtin.lsp_definitions, { buffer = buf, desc = "[G]oto [D]efinition" })
        vim.keymap.set("n", "gO", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })
        vim.keymap.set("n", "gW", builtin.lsp_dynamic_workspace_symbols, { buffer = buf, desc = "Open Workspace Symbols" })
        vim.keymap.set("n", "grt", builtin.lsp_type_definitions, { buffer = buf, desc = "[G]oto [T]ype Definition" })
      end,
    })
  '';

extraPackages = with pkgs; [
  nixfmt
  stylua
  rustfmt
  black
  prettier
  clang-tools
];
}
