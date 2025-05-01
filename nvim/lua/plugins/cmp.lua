return {
    {
        "hrsh7th/nvim-cmp",        -- Autocompletion engine
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({select = true}),
                }),
                sources = {
                    {name = "nvim_lsp"},
                },
            })
        end,
    },
}
