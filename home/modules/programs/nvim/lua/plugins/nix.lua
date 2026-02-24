return {
  {
    "LnL7/vim-nix",
    ft = "nix",  -- só carrega para arquivos .nix
    config = function()
      -- Indentação automática
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "nix",
        callback = function()
          vim.bo.shiftwidth = 2
          vim.bo.tabstop = 2
          vim.bo.expandtab = true
          vim.bo.softtabstop = 2
          vim.bo.autoindent = true
        end
      })
    end
  }
}

