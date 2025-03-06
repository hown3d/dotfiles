return {
  "stevearc/oil.nvim",
  opts = {
    keymaps = {
      ["<BS>"] = "actions.parent",
    },
    view_options = {
      show_hidden = true,
    },
  },
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
}
