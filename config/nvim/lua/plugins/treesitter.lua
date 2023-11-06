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

    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldenable = false -- Disable folding at startup.
    vim.opt.foldlevelstart = 99 -- Open all folds by default.
  end
}
