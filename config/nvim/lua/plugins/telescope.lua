local telescope_plugins = {
  { src = 'https://github.com/nvim-telescope/telescope.nvim', version = '0.1.x' },
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

  -- Narrow down the search results for live_grep by selecting a directory
  local ts_select_dir_for_grep = function(prompt_bufnr)
    local action_state = require("telescope.actions.state")
    local fb = require("telescope").extensions.file_browser
    local live_grep = require("telescope.builtin").live_grep
    local current_line = action_state.get_current_line()

    fb.file_browser({
      files = false,
      depth = false,
      attach_mappings = function(prompt_bufnr)
        require("telescope.actions").select_default:replace(function()
          local entry_path = action_state.get_selected_entry().Path
          local dir = entry_path:is_dir() and entry_path or entry_path:parent()
          local relative = dir:make_relative(vim.fn.getcwd())
          local absolute = dir:absolute()

          live_grep({
            results_title = relative .. "/",
            cwd = absolute,
            default_text = current_line,
          })
        end)

        return true
      end,
    })
  end

  local custom_file_sorter = function(opts)
    local sorters = require("telescope.sorters")
    local default_sorter = sorters.get_fzy_sorter(opts)
    local Sorter = sorters.Sorter

    return Sorter:new({
      scoring_function = function(sorter, prompt, line)
        local score = default_sorter.scoring_function(sorter, prompt, line)

        if score < 0 then
          return score
        end

        if line:match('%_spec.rb$') then
          -- Give some penalty to files we don't want sortet first
          -- We should probably return early on negative scores.
          -- score = score * 2
        end

        return score
      end,
      discard = default_sorter.discard,
      highlighter = default_sorter.highlighter,
    })
  end

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
    pickers = {
      find_files = {
        file_ignore_patterns = { 'node_modules', '^.git/', '.venv' },
        hidden = true,
        sorter = custom_file_sorter({}),
      },
      live_grep = {
        mappings = {
          i = {
            ["<C-f>"] = ts_select_dir_for_grep, -- Select directory for live grep
          },
          n = {
            ["<C-f>"] = ts_select_dir_for_grep, -- Select directory for live grep
          },
        },
        file_ignore_patterns = { 'node_modules', '^.git/', '.venv' },
        additional_args = function(_)
          return { '--hidden' }
        end,
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
  vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = '[ ] Search Files' })
  vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
  vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
  vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
  vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[S]earch [B]uffers' })

  -- Slightly advanced example of overriding default behavior and theme
  vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })

  -- It's also possible to pass additional configuration options.
  --  See `:help telescope.builtin.live_grep()` for information about particular keys
  vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
      grep_open_files = true,
      prompt_title = 'Live Grep in Open Files',
    }
  end, { desc = '[S]earch [/] in Open Files' })

  -- Shortcut for searching your Neovim configuration files
  vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
  end, { desc = '[S]earch [N]eovim files' })
end
