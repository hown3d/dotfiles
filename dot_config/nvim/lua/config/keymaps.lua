vim.keymap.set("n", "<leader>cq", function()
  require("plugins.lsp.yaml.additional-schemas").init()
end, { desc = "Select yaml schema" })

vim.keymap.set("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Telescope integrations
vim.keymap.set("n", "<leader>xx", function()
  require("telescope.builtin").diagnostics({ line_width = "full" })
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>xX", function()
  require("telescope.builtin").diagnostics({ bufnr = 0 })
end, { desc = "Buffer Diagnostics" })

vim.keymap.set("n", "<leader>xT", "<CMD>TodoTelescope<CR>", { desc = "Todo/Fixme/Note" })
vim.keymap.set("n", "<leader>xt", "<CMD>TodoTelescope keywords=TODO<CR>", { desc = "Todo" })
vim.keymap.set(
  "n",
  "<leader>fw",
  "<CMD>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "Find word in current buffer" }
)
