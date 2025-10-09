-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Don't wrap lines
vim.o.wrap = false
-- If wrap is enabled in a buffer, use these settings:
vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.o.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.o.breakindent = true -- Keep indent on wrapped lines (default: false)

-- Folding
vim.o.foldmethod = "indent" -- Fold based on indent level.
vim.o.foldenable = false -- Disable folding at startup.
vim.o.foldlevelstart = 99 -- Open all folds by default.

-- Use two spaces instead of tab
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.showtabline = 2

-- Line numbers
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Set relative numbered lines

-- Enable mouse mode, can be useful for resizing splits for example!
vim.o.mouse = 'a'

-- Use system clipboard
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)

-- Show lines and rows around cursor
vim.o.scrolloff = 10
vim.o.sidescrolloff = 12

-- Scroll 10 lines with Ctrl-D / Ctrl-U
-- We must also set it each time window resizes, since it is normally
-- auto-recalculated based on window height.
vim.o.scroll = 10
vim.api.nvim_create_autocmd({"WinEnter", "WinNew", "WinResized"}, {
  callback = function()
    vim.o.scroll = 10
  end,
})

-- Search case-sensitive
vim.o.ignorecase = false

-- Keep signcolumn on by default. This is used e.g. by LSP or git signs.
vim.o.signcolumn = 'yes'

-- New splits go to the right and below the current window
vim.o.splitright = true
vim.o.splitbelow = true

-- Show certain whitespace characters
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
vim.o.cursorline = true

-- vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
-- vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
-- vim.o.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
-- vim.o.swapfile = false -- Creates a swapfile (default: true)
-- vim.o.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start')
-- vim.o.pumheight = 10 -- Pop up menu height (default: 0)
-- vim.o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
-- vim.o.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
-- vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
-- vim.o.updatetime = 250 -- Decrease update time (default: 4000)
-- vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
-- vim.o.backup = false -- Creates a backup file (default: false)
-- vim.o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
-- vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
-- vim.opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')
-- vim.opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')
-- vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
--
-- -- Do not have compatibility with vi
-- vim.opt.compatible = false
--
--
-- -- Highlight search results
-- vim.o.hlsearch = true
