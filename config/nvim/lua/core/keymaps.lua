-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open new tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close current tab' })
vim.keymap.set('n', '<leader>tc', ':tabonly<CR>', { desc = 'Close all other tabs' })
vim.keymap.set('n', '<Tab>', ':tabn<CR>', { desc = 'Go to next tab' })
vim.keymap.set('n', '<S-Tab>', ':tabp<CR>', { desc = 'Go to previous tab' })
vim.keymap.set("n", "<C-H>", ":tabmove -1<CR>", { desc = 'Move current tab to the left' })
vim.keymap.set("n", "<C-L>", ":tabmove +1<CR>", { desc = 'Move current tab to the right' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP')

-- -- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Fast escape from insert mode
vim.keymap.set("i", "kj", "<Esc>")

-- Do not map Y to y$
vim.keymap.set("n", "Y", "Y")

-- Hide incsearch highlight
vim.keymap.set("n", "//", ":nohlsearch<CR>")

-- Search with "very magic" mode
vim.keymap.set("n", "/", "/\\v")
vim.keymap.set("v", "/", "/\\v")
vim.keymap.set("c", "%s/", "%smagic/")
vim.keymap.set("c", "\\>s/", "\\>smagic/")
vim.keymap.set("n", ":g/", ":g/\\v")
vim.keymap.set("n", ":g//", ":g//\\v")

-- Open file in Chrome
vim.keymap.set('n', '<Leader>oc', ':silent !google-chrome %<CR>:redraw!<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  Use CTRL+SHIFT+<hjkl> to move windows around
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
