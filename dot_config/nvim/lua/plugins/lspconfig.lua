local util = require("lspconfig.util")
return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
    },
    -- make sure mason installs the server
    servers = {
      gopls = {
        gofumpt = false,
      },
      tilt_ls = {
        mason = false,
        cmd = { "tilt", "lsp", "start" },
        filetypes = { "tiltfile" },
        root_dir = util.find_git_ancestor,
        single_file_support = true,
      },
      zls = {
        mason = false,
      },
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              ["kubernetes"] = "**",
            },
          },
        },
      },
    },
  },
}
