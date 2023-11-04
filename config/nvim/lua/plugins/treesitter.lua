return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = {"elixir", "heex", "eex", "lua"},
      sync_install = false,
      ignore_install = { },
      highlight = {
        enable = true,
        disable = { },
      },
    }
  end
}