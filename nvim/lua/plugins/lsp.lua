return {
    {
        "williamboman/mason.nvim", -- Install LSPs, linters, formatters
        build = ":MasonUpdate",     -- optional
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim", -- Bridge mason to lspconfig
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"gopls"},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",   -- Easy LSP setup
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.gopls.setup({
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                settings = {
                    gopls = {
                        analyses = {
                            unusedparams = true,
                            unusedwrite = true,
                            shadow = true,
                        },
                        staticcheck = true,
                        usePlaceholders = true,
                        semanticTokens = true,
                    },
                },
                on_attach = function(client, bufnr)
                    -- Disable formatting to avoid conflicts with none-ls
                    client.server_capabilities.documentFormattingProvider = false
                    client.server_capabilities.documentRangeFormattingProvider = false
                end,
            })
        end,
    },
} 
