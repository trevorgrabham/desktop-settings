return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",        -- auto-update parsers
        config = function() 
            require("nvim-treesitter.configs").setup({
                ensure_installed = {"lua", "go", "gomod", "gowork", "gosum", "bash", "markdown", "python"},       -- parsers that we want
                auto_install = true,
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
}
