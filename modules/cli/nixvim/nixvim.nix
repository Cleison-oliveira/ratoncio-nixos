{inputs, ...}: {
  flake.modules.homeManager.cli-nixvim = {
    imports = [inputs.nixvim.homeModules.nixvim];
    programs.nixvim = {
      enable = true;

      extraLuaPackages = luaPkgs:
        with luaPkgs; [
          jsregexp
        ];

      globals = {
        mapleader = " ";
        maplocalleader = "\\";
      };

      opts = {
        number = true;
        tabstop = 4;
        shiftwidth = 4;
        expandtab = true;
        autoindent = true;
        smartindent = true;
        background = "dark";
        termguicolors = false;
      };

      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      colorschemes.catppuccin = {
        enable = true;
        settings = {
          flavor = "macchiato";
          transparent_background = true;
        };
      };

      highlight = {
        Normal = {bg = "none";};
        NormalFloat = {bg = "none";};
        NormalNC = {bg = "none";};
        LineNr = {bg = "none";};
        SignColumn = {bg = "none";};
        EndOfBuffer = {bg = "none";};
        VertSplit = {bg = "none";};
        WinSeparator = {bg = "none";};
        Folded = {bg = "none";};
        NeoTreeNormal = {bg = "none";};
        NeoTreeNormalNC = {bg = "none";};
        NeoTreeEndOfBuffer = {bg = "none";};
        TelescopeNormal = {bg = "none";};
        TelescopeBorder = {bg = "none";};
      };

      plugins = {
        web-devicons.enable = true;

        lualine = {
          enable = true;
          settings.options.theme = "auto";
        };

        neo-tree = {
          enable = true;
          settings = {
            close_if_last_window = true;
          };
        };

        telescope = {
          enable = true;
          keymaps = {
            "<C-p>" = "find_files";
            "<leader>fg" = "live_grep";
          };
        };

        treesitter = {
          enable = true;
          settings = {
            highlight.enable = true;
            indent.enable = true;
          };
        };

        luasnip.enable = true;

        cmp = {
          enable = true;
          settings = {
            mapping = {
              "<C-Space>" = "cmp.mapping.complete()";
              "<CR>" = "cmp.mapping.confirm({ select = true })";
              "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
              "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            };
            sources = [
              {name = "nvim_lsp";}
              {name = "luasnip";}
            ];
          };
        };

        lsp = {
          enable = true;
          keymaps.lspBuf = {
            gd = "definition";
            K = "hover";
            "<leader>rn" = "rename";
          };
          servers = {
            clangd.enable = true;
            lua_ls.enable = true;
            pyright.enable = true;
            ts_ls.enable = true;
            html.enable = true;
            nixd = {
              enable = true;
              settings.formatting.command = ["alejandra"];
            };
          };
        };

        conform-nvim = {
          enable = true;
          settings = {
            format_on_save = {
              lsp_fallback = true;
              timeout_ms = 500;
            };
            formatters_by_ft = {
              nix = ["alejandra"];
            };
          };
        };
      };

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

      autoCmd = [
        {
          event = ["FileType"];
          pattern = ["nix"];
          callback = {
            __raw = ''
              function(ev)
                vim.bo[ev.buf].shiftwidth = 2
                vim.bo[ev.buf].tabstop = 2
                vim.bo[ev.buf].softtabstop = 2
                vim.bo[ev.buf].expandtab = true
                vim.bo[ev.buf].autoindent = true
                vim.bo[ev.buf].smartindent = true
              end
            '';
          };
        }
      ];
    };
  };
}
