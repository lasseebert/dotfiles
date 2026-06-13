local telescope_plugins = {
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/nvim-telescope/telescope-file-browser.nvim',
}

if vim.fn.executable 'make' == 1 then
  table.insert(telescope_plugins, 'https://github.com/nvim-telescope/telescope-fzf-native.nvim')
end

if vim.g.have_nerd_font then
  table.insert(telescope_plugins, 'https://github.com/nvim-tree/nvim-web-devicons')
end

vim.pack.add(telescope_plugins)

local build_fzf_native = function()
  if vim.fn.executable 'make' ~= 1 then
    return
  end

  local plugin = vim.pack.get({ 'telescope-fzf-native.nvim' }, { info = false })[1]
  if plugin == nil then
    return
  end

  local lib = plugin.path .. '/build/libfzf.so'
  if vim.uv.fs_stat(lib) then
    return
  end

  local result = vim.system({ 'make' }, { cwd = plugin.path }):wait()
  if result.code ~= 0 then
    vim.notify('Failed to build telescope-fzf-native.nvim', vim.log.levels.WARN)
  end
end

build_fzf_native()

do
  -- Telescope is a fuzzy finder that comes with a lot of different things that
  -- it can fuzzy find! It's more than just a "file finder", it can search
  -- many different aspects of Neovim, your workspace, LSP, and more!
  --
  -- The easiest way to use Telescope, is to start by doing something like:
  --  :Telescope help_tags
  --
  -- After running this command, a window will open up and you're able to
  -- type in the prompt window. You'll see a list of `help_tags` options and
  -- a corresponding preview of the help.
  --
  -- Two important keymaps to use while in Telescope are:
  --  - Insert mode: <c-/>
  --  - Normal mode: ?
  --
  -- This opens a window that shows you all of the keymaps for the current
  -- Telescope picker. This is really useful to discover what Telescope can
  -- do as well as how to actually do it!

  -- [[ Configure Telescope ]]
  -- See `:help telescope` and `:help telescope.setup()`
  actions = require('telescope.actions')

  require('telescope').setup {
    -- You can put your default mappings / updates / etc. in here
    --  All the info you're looking for is in `:help telescope.setup()`
    defaults = {
      mappings = {
        i = {
          ['<C-k>'] = actions.move_selection_previous, -- move to prev result
          ['<C-j>'] = actions.move_selection_next, -- move to next result
          ['<C-l>'] = actions.select_default, -- open file
          ['<C-p>'] = actions.cycle_history_prev, -- previous search
          ['<C-n>'] = actions.cycle_history_next, -- next search
          ['<C-u>'] = actions.preview_scrolling_up, -- scroll preview up
          ['<C-d>'] = actions.preview_scrolling_down, -- scroll preview down
        },
      },
      -- Prefer this vertical setup, since I usually run Vim in a terminal that is already tiled left-right.
      -- This gives more horizontal space for the preview window and long file names.
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          width = 0.95,
          height = 0.95,
        },
      },

    },
    extensions = {
      ['ui-select'] = {
        require('telescope.themes').get_dropdown(),
      },
    },
  }

  -- Enable Telescope extensions if they are installed
  pcall(require('telescope').load_extension, 'fzf')
  pcall(require('telescope').load_extension, 'ui-select')

  -- See `:help telescope.builtin`
  local builtin = require 'telescope.builtin'
  vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
  vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })
end
