vim.pack.add({ 'https://github.com/mrjones2014/smart-splits.nvim' })

local smart_splits = require('smart-splits')

smart_splits.setup()

-- Resize splits.
vim.keymap.set('n', '<M-h>', smart_splits.resize_left, { desc = 'Resize split left' })
vim.keymap.set('n', '<M-j>', smart_splits.resize_down, { desc = 'Resize split down' })
vim.keymap.set('n', '<M-k>', smart_splits.resize_up, { desc = 'Resize split up' })
vim.keymap.set('n', '<M-l>', smart_splits.resize_right, { desc = 'Resize split right' })

-- Move between Neovim and tmux splits.
vim.keymap.set('n', '<C-h>', smart_splits.move_cursor_left, { desc = 'Move to split left' })
vim.keymap.set('n', '<C-j>', smart_splits.move_cursor_down, { desc = 'Move to split down' })
vim.keymap.set('n', '<C-k>', smart_splits.move_cursor_up, { desc = 'Move to split up' })
vim.keymap.set('n', '<C-l>', smart_splits.move_cursor_right, { desc = 'Move to split right' })
