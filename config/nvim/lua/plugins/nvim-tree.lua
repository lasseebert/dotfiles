return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    vim.keymap.set("n", "<F2>", ":NvimTreeToggle<CR>")
    vim.keymap.set("n", "<S-F2>", ":NvimTreeFindFile<CR>")

    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        -- Setting this to false will show hidden files (dotfiles)
        dotfiles = false,
      },
    })
  end,
}
