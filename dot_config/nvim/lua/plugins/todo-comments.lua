local pattern = [[\b(KEYWORDS)(\([^)]*\))?:]]

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
}
