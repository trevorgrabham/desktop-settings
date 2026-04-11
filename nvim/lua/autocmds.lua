local group = vim.api.nvim_create_augroup("CWDAutocmds", {clear = true})

-- sets the windows working directory to its parent directory whenever we enter a buffers window
vim.api.nvim_create_autocmd({"BufEnter", "WinEnter"}, {
  pattern = "*",
  callback = function ()
    if vim.bo.buftype ~= "" then
      return
    end

    local buf_dir = vim.fn.expand("%:p:h")
    if buf_dir ~= "" then
      vim.cmd("lcd " .. buf_dir)
    end
  end,
  group = group,
})

-- opens a terminal in the parent directory of the currently selected window
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function ()
    vim.cmd("lcd " .. vim.fn.fnameescape(vim.fn.getcwd(0)))
  end,
  group = group,
})
