return {
  "nvim-telescope/telescope.nvim", tag = "0.1.4",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    find_files = function()
      require("telescope.builtin").find_files({layout_strategy='vertical',layout_config={width=0.95}})
    end

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    require('telescope').setup{
      defaults = {
      },
      pickers = {
      },
      extensions = {
      }
    }
  end
}
