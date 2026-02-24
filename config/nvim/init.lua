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
  -- Fuzzy finder and more
  require 'plugins.telescope',

  -- Git signs in the gutter
  require 'plugins.gitsigns',

  -- Autocompletion framework
  require 'plugins.blink-cmp',

  -- Highlight TODO, NOTE, etc. in comments
  require 'plugins.todo-comments',

  -- A collection of small useful plugins
  require 'plugins.mini',

  -- Colorscheme
  require 'plugins.colorscheme',

  -- Syntax highlighting and code parsing
  require 'plugins.treesitter',

  -- Keymap preview and discovery
  require 'plugins.which-key',

  -- Switch between alternate files
  require 'plugins.other',

  -- Adds new indent text objects
  require 'plugins.indent-object',

  -- Copilot completions
  require 'plugins.copilot',

  -- Pomodoro timer
  require 'plugins.pomodoro',

  -- Vim practice
  require 'plugins.hardtime',

  -- File explorer
  require 'plugins.oil',

  -- Typing practice
  require 'plugins.typr',
}, {
})
