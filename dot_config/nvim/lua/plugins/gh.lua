return {
  {
    "ldelossa/gh.nvim",
    dependencies = {
      {
        "ldelossa/litee.nvim",
        config = function()
          require("litee.lib").setup()
        end,
      },
    },
    main = "litee.gh",
    opts = {},
  },
  {
    "Almo7aya/openingh.nvim",
  },
}
