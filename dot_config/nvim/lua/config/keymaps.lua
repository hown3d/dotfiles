vim.keymap.set("n", "<leader>cq", function()
  require("plugins.lsp.yaml.additional-schemas").init()
end, { desc = "Select yaml schema" })

vim.keymap.set("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Open parent directory" })
