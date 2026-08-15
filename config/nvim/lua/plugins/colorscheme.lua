vim.pack.add({'https://github.com/catppuccin/nvim.git'})

require('catppuccin').setup({})

vim.cmd.colorscheme("catppuccin")

-- Disable italics for Elixir module names
local elixir_module_highlight = vim.api.nvim_get_hl(0, { name = '@module.elixir', link = false })
elixir_module_highlight.italic = false
elixir_module_highlight.cterm = vim.tbl_extend('force', elixir_module_highlight.cterm or {}, { italic = false })
vim.api.nvim_set_hl(0, '@module.elixir', elixir_module_highlight)
