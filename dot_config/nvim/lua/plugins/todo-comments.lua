return {
  "folke/todo-comments.nvim",
  opts = {
    highlight = {
      pattern = [[.*<((KEYWORDS)(.+\))?)\s*:]],
    },
    search = {
      pattern = [[\b(KEYWORDS)(?:\(.+\))?\s*:]],
    },
  },
  keys = {
    -- disable trouble keymaps
    { "<leader>xT", false },
    { "<leader>xt", false },
  },
}
