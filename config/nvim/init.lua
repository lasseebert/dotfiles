-- This is my old config. My intention is to merge Kickstart.nvim with this
--
require 'core.options'
require 'core.keymaps'
require 'core.filetypes'

-- Install Lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

---@type vim.Option
local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
  -- Syntax highlighting and code parsing
  require 'plugins.treesitter',

  -- Pomodoro timer
  require 'plugins.pomodoro',
}, {
})

-- Ensure vim.pack install dir is on packpath
-- This can probably be removed after Lazy is fully migrated to vim.pack
do
  local data_site = vim.fn.stdpath('data') .. '/site'
  if not vim.o.packpath:find(data_site, 1, true) then
    vim.opt.packpath:prepend(data_site)
  end
end

-- File explorer (vim.pack)
require 'plugins.oil'

-- Statusline
require 'plugins.lualine'

-- Keymap preview and discovery
require 'plugins.which-key'

-- Git signs in the gutter
require 'plugins.gitsigns'

-- A collection of small useful plugins
require 'plugins.mini'

-- Highlight TODO, NOTE, etc. in comments
require 'plugins.todo-comments'

-- Elixir support
require 'plugins.elixir'

-- Switch between alternate files
require 'plugins.other'

-- Adds new indent text objects
require 'plugins.indent-object'

-- Copilot completions
require 'plugins.copilot'

-- Autocompletion framework
require 'plugins.blink-cmp'

-- Fuzzy finder and more
require 'plugins.telescope'

-- Colorscheme
require 'plugins.colorscheme'
