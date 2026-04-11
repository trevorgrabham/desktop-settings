return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "horizontal",
          layout_config = {
            width = 0.9,
            height = 0.85,
          },
          sorting_strategy = "descending",
          prompt_prefix = "❯ ",
          selection_caret = "➤ ",
        },
      })
    end,
  },
}
