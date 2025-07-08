-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Don't wrap lines
vim.o.wrap = false

-- Folding
vim.o.foldmethod = "indent" -- Fold based on indent level.
vim.o.foldenable = false -- Disable folding at startup.
vim.o.foldlevelstart = 99 -- Open all folds by default.

-- vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)
-- vim.o.mouse = 'a' -- Enable mouse mode (default: '')
-- vim.o.cursorline = true -- Highlight the current line (default: false)
-- vim.o.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
-- vim.o.splitright = true -- Force all vertical splits to go to the right of current window (default: false)
-- vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
-- vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)
-- vim.o.whichwrap = 'bs<>[]hl' -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
-- vim.o.numberwidth = 4 -- Set number column width to 2 {default 4} (default: 4)
-- vim.o.swapfile = false -- Creates a swapfile (default: true)
-- vim.o.backspace = 'indent,eol,start' -- Allow backspace on (default: 'indent,eol,start')
-- vim.o.pumheight = 10 -- Pop up menu height (default: 0)
-- vim.o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)
-- vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default (default: 'auto')
-- vim.o.fileencoding = 'utf-8' -- The encoding written to a file (default: 'utf-8')
-- vim.o.cmdheight = 1 -- More space in the Neovim command line for displaying messages (default: 1)
-- vim.o.breakindent = true -- Enable break indent (default: false)
-- vim.o.updatetime = 250 -- Decrease update time (default: 4000)
-- vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)
-- vim.o.backup = false -- Creates a backup file (default: false)
-- vim.o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
-- vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience (default: 'menu,preview')
-- vim.opt.shortmess:append 'c' -- Don't give |ins-completion-menu| messages (default: does not include 'c')
-- vim.opt.iskeyword:append '-' -- Hyphenated words recognized by searches (default: does not include '-')
-- vim.opt.formatoptions:remove { 'c', 'r', 'o' } -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
-- vim.opt.runtimepath:remove '/usr/share/vim/vimfiles' -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
--
-- -- Do not have compatibility with vi
-- vim.opt.compatible = false
--
-- -- Use system clipboard
-- vim.opt.clipboard = 'unnamedplus'
--
-- -- Highlight search results
-- vim.o.hlsearch = true
--
-- -- Line numbers
-- vim.wo.number = true -- Show line numbers
-- vim.o.relativenumber = true -- Set relative numbered lines
--
-- -- Show invisible chars
-- vim.wo.listchars = "tab:▷⋅,trail:·"
-- vim.wo.list = true
--
-- -- Use two spaces instead of tab
-- vim.opt.expandtab = true
-- vim.opt.shiftwidth = 2
-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.smartindent = true
-- vim.opt.autoindent = true
-- vim.opt.showtabline = 2
-- --vim.opt.cindent = true
-- --vim.opt.cinkeys = "0{,0},:,0#,!^F"
--
-- -- Show lines and rows around cursor
-- vim.opt.scrolloff = 5
-- vim.o.sidescrolloff = 8
