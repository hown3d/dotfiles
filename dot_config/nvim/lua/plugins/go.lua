return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
  {
    "leoluz/nvim-dap-go",
    opts = {
      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Connect remote",
          request = "attach",
          mode = "remote",
          -- substitutePath = {
          --   {
          --     from = "${workspaceFolder}",
          --     to = "/app",
          --   },
          -- },
        },
      },
      delve = {
        port = 2345,
      },
    },
  },
  {
    "nvim-contrib/nvim-ginkgo",
  },
}
