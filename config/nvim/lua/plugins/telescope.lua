return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()

    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

    -- NOTE: live_grep requires ripgrep to be installed on the system
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    telescope.setup{
      defaults = {
        -- Prefer this vertical setup, since I usually run Vim in a terminal that is already tiled left-right.
        -- This gives more horizontal space for the preview window and long file names.
        layout_strategy = "vertical",
        layout_config = {
          vertical = {
            width = 0.95,
            height = 0.95,
          },
        },

        -- Be able to cycle through search history
        mappings = {
          i = {
            ['<C-j>'] = actions.cycle_history_next,
            ['<C-k>'] = actions.cycle_history_prev
          }
        }
      },

      -- Also search in hidden files and folders
      pickers = {
        find_files = {
          hidden = true,

          -- Use C-p (in addition to the default) to find previous history, since I'm used to it from CtrlP
          mappings = {
            i = {
              ['<C-p>'] = actions.cycle_history_prev
            }
          }
        },
        live_grep = {
          hidden = true,
        },
      },

      extensions = {
      }
    }
  end
}
