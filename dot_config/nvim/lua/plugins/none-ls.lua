return {
  "nvimtools/none-ls.nvim",
  enabled = false,
  opts = function(_, opts)
    local remove_sources = { "gofumpt" }
    opts.sources = vim.tbl_filter(function(source)
      return not vim.tbl_contains(remove_sources, source.name)
    end, opts.sources)
  end,
}
