return {
  "numToStr/Comment.nvim",
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  opts = function ()
    return { prehook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook() }
  end,
  config = function (_, opts)
    require("Comment").setup(opts)
    local api = require("Comment.api")
    vim.keymap.set("n", "<C-_>", function ()
      api.toggle.linewise.current()
    end, { desc = "Toggle comment line" })
    vim.keymap.set("x", "<C-_>", function ()
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = "Toggle comment selection" })
  end,
}
