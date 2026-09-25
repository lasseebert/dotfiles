vim.pack.add({
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons'
})

local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local ready = {}
  local loading = {}
  local starting = {}

  for _, client in ipairs(clients) do
    -- Copilot is technically an LSP client, but it does not make navigation
    -- features like go-to-definition ready.
    if client.name ~= 'copilot' then
      if not client.initialized then
        table.insert(starting, client.name)
      elseif next(client.progress.pending) ~= nil then
        table.insert(loading, client.name)
      else
        table.insert(ready, client.name)
      end
    end
  end

  if #loading > 0 then
    return 'LSP: loading ' .. table.concat(loading, ', ')
  end

  if #ready > 0 then
    return 'LSP: ' .. table.concat(ready, ', ')
  end

  if #starting > 0 then
    return 'LSP: starting ' .. table.concat(starting, ', ')
  end

  return ''
end

-- LSP initialization can finish before a server has built/indexed the
-- project. Redraw as its work-done progress changes so lsp_status reflects
-- that second phase immediately.
vim.api.nvim_create_autocmd('LspProgress', {
  group = vim.api.nvim_create_augroup('lualine-lsp-progress', { clear = true }),
  callback = function()
    vim.cmd.redrawstatus()
  end,
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {},
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'diagnostics' },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { lsp_status, 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}
