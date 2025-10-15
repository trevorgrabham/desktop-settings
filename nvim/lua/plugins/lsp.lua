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
                ensure_installed = {"gopls", "pylsp"},
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",   -- Easy LSP setup
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            -- common on_attach disables formatting so null-ls can handle it
            local function on_attach(client, bufnr)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end

            vim.lsp.config("gopls", {
                capabilities = capabilities,
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
                on_attach = on_attach,
            })
            vim.lsp.config("pylsp", {
                capabilites = capabilities,
                settings = {
                    pylsp = {
                        plugins = { 
                            pyflakes = { enabled = true },
                            pycodestyle = { enabled = false },
                            black = { enabled = true },
                            isort = { enabled = true },
                        },
                    },
                },
                on_attach = on_attach,
            })
        end,
    },
} 
