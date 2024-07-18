vim.keymap.set("n", "<leader>cq", function()
  require("plugins.lsp.yaml.additional-schemas").init()
end, { desc = "Select yaml schema" })

-- vim.keymap.set("n", "<leader>ee", "<cmd>Telescope file_browser<CR>", { desc = "File browser" })
-- vim.keymap.set(
--   "n",
--   "<leader>eb",
--   "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>",
--   { desc = "File browser in folder of current buffer" }
-- )
