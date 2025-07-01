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

-- Line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrapping' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

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

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- Delete single character without copying into register
vim.keymap.set('n', 'x', '"_x')

-- Keep last yanked when pasting in visual mode
vim.keymap.set('v', 'p', '"_dP')

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Open file in Chrome
vim.keymap.set('n', '<Leader>oc', ':silent !google-chrome %<CR>:redraw!<CR>')
