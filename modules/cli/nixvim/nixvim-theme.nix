{
  flake.modules.homeManager.cli-nixvim = {
    programs.nixvim = {
      colorschemes.base16 = {
        enable = true;
        colorscheme = {
          base00 = "#232627";
          base01 = "#31363B";
          base02 = "#63686D";
          base03 = "#7A7C7D";
          base04 = "#7F8C8D";
          base05 = "#F0F3F5";
          base06 = "#F9FAFB";
          base07 = "#FFFFFF";
          base08 = "#E85A66";
          base09 = "#F2C55F";
          base0A = "#F9D594";
          base0B = "#6BC47B";
          base0C = "#56B6C2";
          base0D = "#61AFEF";
          base0E = "#C678DD";
          base0F = "#E85A66";
        };
      };

      highlight = let
        breezeBg = "#232627";
        breezeBgAlt = "#31363B";
        breezeBgHighlight = "#3DAEE9";
        breezeFgDim = "#7A7C7D";
        breezeBorder = "#7A7C7D";
        breezeErrorBg = "#4D2C31";
        breezeRed = "#E85A66";
        breezeGreen = "#6BC47B";
        breezeYellow = "#F2C55F";
        breezeBlue = "#61AFEF";
        breezePurple = "#C678DD";
        breezeCyan = "#56B6C2";
        breezeText = "#F0F3F5";
        breezeWhite = "#F9FAFB";
      in {
        Normal = {bg = breezeBg;};
        NormalNC = {bg = breezeBg;};
        NormalFloat = {bg = breezeBgAlt;};

        SignColumn = {
          bg = breezeBg;
          fg = breezeFgDim;
        };
        EndOfBuffer = {
          bg = breezeBg;
          fg = breezeBg;
        };
        LineNr = {
          bg = breezeBg;
          fg = breezeFgDim;
        };
        CursorLineNr = {
          bg = breezeBg;
          bold = true;
        };
        CursorLine = {bg = breezeBgAlt;};
        CursorColumn = {bg = breezeBgAlt;};
        ColorColumn = {bg = breezeBgAlt;};

        Visual = {
          bg = breezeBgHighlight;
          fg = breezeWhite;
        };
        VisualNOS = {
          bg = breezeBgHighlight;
          fg = breezeWhite;
        };
        Search = {
          bg = "#218058";
          fg = "#F0F3F5";
        };
        IncSearch = {
          bg = "#808021";
          fg = "#F0F3F5";
        };

        VertSplit = {
          fg = breezeBorder;
          bg = breezeBg;
        };
        WinSeparator = {
          fg = breezeBorder;
          bg = breezeBg;
        };
        FloatBorder = {
          fg = breezeBorder;
          bg = breezeBgAlt;
        };

        Folded = {
          bg = breezeBgAlt;
          fg = breezeFgDim;
        };
        FoldColumn = {
          bg = breezeBg;
          fg = breezeFgDim;
        };

        TabLine = {
          bg = breezeBgAlt;
          fg = breezeFgDim;
        };
        TabLineFill = {bg = breezeBgAlt;};
        TabLineSel = {
          bg = breezeBgHighlight;
          bold = true;
        };
        StatusLine = {bg = breezeBgAlt;};
        StatusLineNC = {
          bg = breezeBgAlt;
          fg = breezeFgDim;
        };

        Pmenu = {bg = breezeBgAlt;};
        PmenuSel = {
          bg = breezeBgHighlight;
          bold = true;
        };
        PmenuSbar = {bg = "#4D5057";};
        PmenuThumb = {bg = "#7A7C7D";};

        NeoTreeNormal = {
          bg = breezeBg;
          fg = breezeText;
        };
        NeoTreeNormalNC = {
          bg = breezeBg;
          fg = breezeText;
        };
        NeoTreeFloatBorder = {
          fg = breezeBorder;
          bg = breezeBgAlt;
        };
        NeoTreeCursorLine = {
          bg = breezeBgHighlight;
          fg = breezeWhite;
        };
        NeoTreeDirectoryName = {fg = breezeText;};
        NeoTreeDirectoryIcon = {fg = breezeBlue;};
        NeoTreeFileName = {fg = breezeText;};
        NeoTreeFileNameOpened = {fg = breezeWhite;};
        NeoTreeFileIcon = {fg = breezeText;};
        NeoTreeGitAdded = {fg = breezeGreen;};
        NeoTreeGitDeleted = {fg = breezeRed;};
        NeoTreeGitModified = {fg = breezeYellow;};
        NeoTreeGitRenamed = {fg = breezeYellow;};
        NeoTreeGitUntracked = {fg = breezePurple;};
        NeoTreeIndentMarker = {fg = "#63686D";};
        NeoTreeExpander = {fg = "#63686D";};

        TelescopeNormal = {bg = breezeBgAlt;};
        TelescopeBorder = {
          fg = breezeBorder;
          bg = breezeBgAlt;
        };
        TelescopePromptNormal = {bg = breezeBgAlt;};
        TelescopePromptBorder = {
          fg = breezeBorder;
          bg = breezeBgAlt;
        };
        TelescopeSelection = {bg = breezeBgHighlight;};

        ErrorMsg = {
          bg = breezeErrorBg;
          fg = breezeWhite;
          bold = true;
        };
        WarningMsg = {
          fg = breezeYellow;
          bold = true;
        };
        MoreMsg = {
          fg = breezeBlue;
        };
        ModeMsg = {
          fg = breezeGreen;
          bold = true;
        };
        Question = {
          fg = breezeYellow;
          bold = true;
        };
        Title = {
          fg = breezeBlue;
          bold = true;
        };
        DiagnosticVirtualTextError = {
          bg = breezeBg;
          fg = breezeRed;
          italic = true;
        };
        DiagnosticVirtualTextWarn = {
          bg = breezeBg;
          fg = breezeYellow;
          italic = true;
        };
        DiagnosticVirtualTextInfo = {
          bg = breezeBg;
          fg = breezeBlue;
          italic = true;
        };
        DiagnosticVirtualTextHint = {
          bg = breezeBg;
          fg = breezeFgDim;
          italic = true;
        };
      };
    };
  };
}
