-- Open quickfix item in new tab
-- This is autoloaded by Neovim per file location, and after all built-in
-- quickfix mappings are loaded, so we can override them here.
vim.keymap.set('n', 't', function()
  local item = vim.fn.getqflist()[vim.fn.line('.')]
  if not item or item.bufnr == 0 then
    return
  end

  local filename = vim.api.nvim_buf_get_name(item.bufnr)
  vim.cmd('tabedit ' .. vim.fn.fnameescape(filename))
  vim.api.nvim_win_set_cursor(0, {
    math.max(item.lnum, 1),
    math.max((item.col or 1) - 1, 0),
  })
end, { buffer = true, desc = 'Open quickfix item in new tab' })
