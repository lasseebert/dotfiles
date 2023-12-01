return {
  { "IndianBoy42/tree-sitter-just" },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require('tree-sitter-just').setup({})
      require'nvim-treesitter.configs'.setup {
        ensure_installed = {"elixir", "heex", "eex", "lua", "ruby", "just"},
        sync_install = false,
        ignore_install = { },
        highlight = {
          enable = true,
          disable = { },
        },
        indent = {
          -- This does not work with Ruby
          enable = true,
          disable = { "ruby" },
        }
      }
    end
  }
}
