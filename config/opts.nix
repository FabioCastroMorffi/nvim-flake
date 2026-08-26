{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
    have_nerd_font = true;
  };

  opts = {
    number = true;
    sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"; # what gets remembered when clossing session
    mouse = "a"; # in what mode responds to mouse input
    showmode = false; # shows mode in command line (already shown by atc line)
    clipboard = "unnamedplus";
    breakindent = true;

    undofile = true;
    signcolumn = "yes";
    updatetime = 250;
    timeoutlen = 300;
    splitright = true;
    splitbelow = true;

    inccommand = "split";
    cursorline = true;
    scrolloff = 10;
    confirm = true;

    # fold
    list = true;
    listchars = {
      tab = "» ";
      trail = "·";
      nbsp = "␣";
    };

    # tab
    shiftwidth = 2;
    softtabstop = 2;
    expandtab = true;
    shiftround = true;
    smartindent = true;

    # search
    ignorecase = true;
    smartcase = true;
    incsearch = true;
    hlsearch = true;
  };
}
