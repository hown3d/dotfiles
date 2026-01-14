return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = true,
    },
    -- make sure mason installs the server
    servers = {
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
