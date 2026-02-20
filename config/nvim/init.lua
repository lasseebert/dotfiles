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
  require 'plugins.telescope',
  require 'plugins.gitsigns',
  require 'plugins.blink-cmp',
  require 'plugins.todo-comments',
  require 'plugins.mini',
  require 'plugins.colorscheme',
  require 'plugins.treesitter',
  require 'plugins.which-key',
  require 'plugins.other',
  require 'plugins.indent-object',
  require 'plugins.copilot',
  require 'plugins.pomodoro',
  require 'plugins.hardtime',
  require 'plugins.oil',
}, {
})
