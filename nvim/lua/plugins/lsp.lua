local servers = {
  "gopls",
  "pyright",
  "bashls",
  "html",
  "cssls",
  "templ",
  "lua_ls",
  "emmet_language_server",
}

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
        ensure_installed = servers,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",   -- Easy LSP setup
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- common on_attach disables formatting so null-ls can handle it
      local function on_attach(client, _)
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end

      for _, server in ipairs(servers) do
        local opts = {
          capabilities = capabilities,
          on_attach = on_attach,
        }

        if server == "gopls" then
          opts.settings = {
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
          }
        elseif server == "lua_ls" then
          opts.settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              diagnostics = { globals = { "vim" } },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              telemetry = { enabled = false },
            },
          }
        elseif server == "emmet_language_server" then
          opts.cmd = { vim.fn.stdpath("data") .. "/mason/bin/emmet-language-server", "--stdio" }
          opts.filetypes = {
            "html",
            "css",
            "javascriptreact",
            "typescriptreact",
            "templ",
          }
          opts.init_options = {
            includeLanguages = { templ = "html" },
          }
        end

        vim.lsp.config(server, opts)
      end
    end,
  },
}
