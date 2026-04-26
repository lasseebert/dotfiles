-- This is my old config. My intention is to merge Kickstart.nvim with this
--
require 'core.options'
require 'core.keymaps'
require 'core.filetypes'

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

-- Syntax highlighting and code parsing
require 'plugins.treesitter'

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

-- Pomodoro timer
require 'plugins.pomodoro'

-- Autocompletion framework
require 'plugins.blink-cmp'

-- Fuzzy finder and more
require 'plugins.telescope'

-- Colorscheme
require 'plugins.colorscheme'
