-- Load custom settings, mappings
require("settings")
require("keymaps")
require("autocmds")
local status_ok, _ = pcall(require, "config.lazy-bootstrap")
if not status_ok then
  vim.notify("Failed to bootstrap lazy.nvim")
  return
end
require("lazy").setup({import="plugins"})
