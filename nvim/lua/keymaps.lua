-- general files
vim.keymap.set('i', 'jj', '<Esc>', { desc = "Escape" })
vim.keymap.set('t', 'jj', [[<C-\><C-n>]], { desc = "Escape terminal mode" })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = "Save file" })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = "Quit" })
vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = "Move left" })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = "Move right" })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = "Move up" })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = "Move down" })
vim.keymap.set('n', '<leader>c', '<C-w>c', { desc = "Close window" })
vim.keymap.set('n', '<Esc>', '<Cmd>nohlsearch<CR>', { desc = "Clear highlights" })
-- window sizing
vim.keymap.set('n', '<leader>.', '<C-w>>', { desc = "Increase window width" })
vim.keymap.set('n', '<leader>,', '<C-w><', { desc = "Decrease window width" })
vim.keymap.set('n', '<leader>=', '<C-w>+', { desc = "Increase window length" })
vim.keymap.set('n', '<leader>-', '<C-w>-', { desc = "Decrease window length" })
-- window splits
vim.keymap.set('n', '<leader>nr', ':vsp ', { desc = "New vertical window split" })
vim.keymap.set('n', '<leader>nd', ':sp ', { desc = "New horizontal window split" })
vim.keymap.set('n', '<leader>ntr', ':vsp | terminal<CR>', { desc = "New terminal in vertical window split" })
vim.keymap.set('n', '<leader>ntd', ':sp | terminal<CR>', { desc = "New terminal in horizontal window split" })
-- copy and paste
vim.keymap.set('v', '<C-c>', '"+y', { desc = "Copy to clipboard" })
vim.keymap.set('n', '<C-v>', '"+p', { desc = "Paste from clipboard" })
vim.keymap.set('i', '<C-v>', '<Esc>"+pa', { desc = "Paste from clipboard" })
vim.keymap.set('n', '<leader>t', ':r !', { desc = "Insert terminal output at cursor" })
-- telescope 
vim.keymap.set('n', '<leader>ff', function ()
  local cwd
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients > 0 then
    cwd = clients[1].config.root_dir
  else
    local root = vim.fs.find({ ".git", "package.json", "pyproject.toml", "go.mod" }, { upward = true })[1]
    cwd = root and vim.fs.dirname(root) or vim.loop.cwd()
  end
  require("telescope.builtin").find_files({ cwd = cwd })
end, { desc = "Find files" })
vim.keymap.set('n', '<leader>fg', ':Telescope live_grep<CR>', { desc = "Search in files" })
vim.keymap.set('n', '<leader>fb', ':Telescope buffers<CR>', { desc = "List open buffers" })
-- fzf
vim.keymap.set('n', '<leader>fa', '<cmd>FzfLua files cwd=/home/trevorgrabham/<CR>', { desc = "Global find files" })
-- buffer navigation
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = "Next buffer" })
vim.keymap.set('n', '<leader>bp', ':bprev<CR>', { desc = "Previous buffer" })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = "Close buffer" })
-- center search navigation
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Next search result and center" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Previous search result and center" })
-- move selected lines up and down in visual mode
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = "Move line up" })
-- lsp
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover docs" })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Find references" })
-- diagnostics
vim.keymap.set('n', '<leader>d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set('n', '<leader>D', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
-- go
vim.keymap.set('n', '<leader>go', ':w<CR>:split | terminal go run %<CR>', { desc = "Builds the current .go file and runs it in a new terminal" })
-- python
vim.keymap.set('n', '<leader>py', ':w<CR>:split | terminal python3 %<CR>', { desc = "Builds the current .py file and runs it in a new terminal" })
