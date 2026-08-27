{ pkgs, ...}:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "duck";
      src = pkgs.fetchFromGitHub {
        owner = "tamton-aquib";
        repo = "duck.nvim";
        rev = "main";
        hash = "sha256-97QSkZHpHLq1XyLNhPz88i9VuWy6ux7ZFNJx/g44K2A=";
      };
    })
     pkgs.vimPlugins.cellular-automaton-nvim
  ];

  extraConfigLua = ''
    -- Duck

    vim.keymap.set("n", "<leader>dd", function()
      require("duck").hatch("🦖")
    end, { desc = "Hatch Duck" })
    vim.keymap.set("n", "<leader>dk", function()
      require("duck").cook()
    end, { desc = "Cook Duck" })
    vim.keymap.set("n", "<leader>da", function()
      require("duck").cook_all()
    end, { desc = "Cook All Ducks" })

  '';
}
