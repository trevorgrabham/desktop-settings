return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.goimports,
                    null_ls.builtins.diagnostics.golangci_lint,
                    null_ls.builtins.code_actions.gitsigns,
                },
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentFormattingProvider then
                        local augroup_formatting = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = augroup_formatting,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({
                                    filter = function(c)
                                        return c.name == "null-ls"
                                    end,
                                })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
