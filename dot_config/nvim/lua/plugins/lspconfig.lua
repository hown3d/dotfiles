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
        semantic_tokens = "full",
        warn_style = false,
        highlight_global_var_declarations = false,
        -- NOTE: never seen an inlay hint
        -- and I don't know what record_session does
        -- nor dangerous_comptime_experiments_do_not_enable...
        enable_inlay_hints = true,
        inlay_hints_show_builtin = true,
        inlay_hints_exclude_single_argument = true,
        inlay_hints_hide_redundant_param_names = true,
        inlay_hints_hide_redundant_param_names_last_token = true,
        dangerous_comptime_experiments_do_not_enable = true,
        skip_std_references = true,
        record_session = true,
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
