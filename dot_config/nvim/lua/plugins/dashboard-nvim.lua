return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    opts.config.center = opts.config.center or {}

    opts.config.center[3].key = "P"

    -- vim.list_extend(opts.config.center, {
    --   {
    --     action = "Octo issue search",
    --     icon = "󰊤 ",
    --     desc = " Search issues",
    --     key = "i",
    --     key_format = "  %s",
    --   },
    --   {
    --     action = "Octo pr search",
    --     icon = "󰊤 ",
    --     desc = " Search PRs",
    --     key = "p",
    --     key_format = "  %s",
    --   },
    -- })
  end,
}
