return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local dap = require("dap")
      local dap_go_adapter = dap.adapters.go
      dap.adapters.go = function(callback, client_config)
        if client_config.mode == "remote" and client_config.host and client_config.port then
          callback({
            type = "server",
            host = client_config.host,
            port = client_config.port,
          })
          return
        end
        dap_go_adapter(callback, client_config)
      end
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
