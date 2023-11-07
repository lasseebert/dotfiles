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

    -- NOTE: live_grep requires ripgrep to be installed on the system
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    telescope.setup{
      defaults = {
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
          hidden = true,
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
