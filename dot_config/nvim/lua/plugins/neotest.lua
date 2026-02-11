return {
  "nvim-neotest/neotest",
  lazy = false,
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    {
      "<leader>tA",
      function()
        local neotest = require("neotest")
        neotest.state.adapter_ids()

        local adapters = neotest.state.adapter_ids()
        vim.ui.select(adapters, { prompt = "Select adapter: " }, function(selection)
          if not selection then
            return
          end
          neotest.run.run({
            suite = false,
            adapter = selection,
          })
        end)
      end,
      desc = "Run File with adapter selection (Neotest)",
    },
  },
  opts = {
    adapters = {
      ["nvim-ginkgo"] = {},
    },
  },
}
