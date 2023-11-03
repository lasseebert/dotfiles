-- disable netrw at the very start of your init.lua, because we use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "
require("config.lazy")

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Fast escape from insert mode
vim.keymap.set("i", "kj", "<Esc>")

-- Do not map Y to y$
vim.keymap.set("n", "Y", "Y")

-- Hide incsearch highlight
vim.keymap.set("n", "//", ":nohlsearch<CR>")

-- Show line numbers
vim.wo.number = true

-- Show invisible chars
vim.wo.listchars = "tab:▷⋅,trail:·"
vim.wo.list = true

-- Don't wrap lines
vim.wo.wrap = false

-- Use two spaces instead of tab
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.cindent = true
vim.opt.smartindent = true
vim.opt.autoindent = true
