vim.keymap.set("n", "<leader>cq", function()
  require("plugins.lsp.yaml.additional-schemas").init()
end, { desc = "Select yaml schema" })

vim.keymap.set("n", "<leader>ee", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- find marks
vim.keymap.set("n", "<leader>fm", "<CMD>Telescope marks<CR>", { desc = "Find marks" })

-- Telescope integrations
vim.keymap.set("n", "<leader>xx", function()
  require("telescope.builtin").diagnostics({ line_width = "full", sort_by = "severity" })
end, { desc = "Diagnostics" })

vim.keymap.set("n", "<leader>xX", function()
  require("telescope.builtin").diagnostics({ bufnr = 0, sort_by = "severity" })
end, { desc = "Buffer Diagnostics" })

vim.keymap.set("n", "<leader>xT", "<CMD>TodoTelescope<CR>", { desc = "Todo/Fixme/Note" })
vim.keymap.set("n", "<leader>xt", "<CMD>TodoTelescope keywords=TODO<CR>", { desc = "Todo" })
vim.keymap.set(
  "n",
  "<leader>fw",
  "<CMD>Telescope current_buffer_fuzzy_find<CR>",
  { desc = "Find word in current buffer" }
)

-- recommended mappings
-- resizing splits
-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
local smart_splits = require("smart-splits")
vim.keymap.set("n", "<A-h>", smart_splits.resize_left)
vim.keymap.set("n", "<A-j>", smart_splits.resize_down)
vim.keymap.set("n", "<A-k>", smart_splits.resize_up)
vim.keymap.set("n", "<A-l>", smart_splits.resize_right)
-- moving between splits
vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)
vim.keymap.set("n", "<C-\\>", smart_splits.move_cursor_previous)
-- swapping buffers between windows
vim.keymap.set("n", "<leader><leader>h", smart_splits.swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", smart_splits.swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", smart_splits.swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", smart_splits.swap_buf_right)
