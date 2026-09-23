return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
    },
    -- make sure mason installs the server
    servers = {
      gopls = {
        settings = {
          gopls = {
            gofumpt = false,
            staticcheck = false,
            expandWorkspaceToModule = false,
          },
        },
      },
      yamlls = {
        settings = {
          yaml = {
            format = {
              enable = false,
            },
            schemas = {
              ["kubernetes"] = "**",
            },
          },
        },
      },
    },
  },
}
