return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = {"elixir", "heex", "eex", "lua", "ruby"},
      sync_install = false,
      ignore_install = { },
      highlight = {
        enable = true,
        disable = { },
      },
      indent = {
        enable = true
      }
    }
  end
}
