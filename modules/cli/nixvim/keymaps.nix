{inputs, ...}: {
  flake.modules.homeManager.cli-nixvim = {
    programs.nixvim = {
      keymaps = [
        {
          mode = "v";
          key = "y";
          action = "\"+y";
          options.silent = true;
        }
        {
          mode = "v";
          key = "p";
          action = "\"+p";
          options.silent = true;
        }

        {
          mode = ["n" "v"];
          key = "<C-a>";
          action = "ggVG";
          options.silent = true;
        }

        {
          mode = "n";
          key = "<C-n>";
          action = "<cmd>Neotree filesystem reveal left<CR>";
        }

        {
          mode = ["n" "v"];
          key = "<Leader>i";
          action = "<cmd>lua if vim.fn.mode() == 'v' or vim.fn.mode() == 'V' then vim.cmd('normal! =') else vim.cmd('normal! gg=G') end<CR>";
          options.silent = true;
        }
      ];
    };
  };
}
