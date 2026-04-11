return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function ()
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("data") .. "/lazy/friendly-snippets" }
      })

      vim.keymap.set({"i", "s"}, "<Tab>", function ()
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          return "<Tab>"
        end
      end, {expr = true, silent = true})
    end
  },
}
