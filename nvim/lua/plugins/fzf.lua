return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    require("fzf-lua").setup({
      files = {
        fd_opts = [[
          --type f
          --hidden
          --follow
          --exclude .git
          --exclude node_modules
          --exclude proc
          --exclude sys
          --exclude dev
          --exclude tmp
          --exclude run
          --exclude usr
          --exclude bin
          --exclude lib
        ]],
      },
    })
  end,
}
