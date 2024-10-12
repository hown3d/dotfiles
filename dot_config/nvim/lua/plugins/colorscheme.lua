return {
  {
    "catppuccin",
    opts = {
      transparent_background = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = true,
    opts = function(_, opts)
      local gruvbox = require("gruvbox")
      opts.overrides = {
        LspReferenceRead = { bg = gruvbox.palette.dark3 },
        LspReferenceText = { link = "LspReferenceRead" },
        LspReferenceWrite = { link = "LspReferenceText" },
      }
    end,
  },
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    config = function(_, opts)
      require("everforest").setup(opts)
    end,
    opts = {
      transparent_background_level = 2,
      on_highlights = function(hl, palette)
        -- The default highlights for TSBoolean is linked to `Purple` which is fg
        -- purple and bg none. If we want to just add a bold style to the existing,
        -- we need to have the existing *and* the bold style. (We could link to
        -- `PurpleBold` here otherwise.)
        hl.CurrentWord = { bg = palette.bg4, bold = true }
      end,
    },
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "everforest",
    },
  },
}
