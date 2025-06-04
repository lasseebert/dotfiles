-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      'bash',
      'cmake',
      'css',
      'dockerfile',
      'elixir',
      'gitignore',
      'graphql',
      'html',
      'javascript',
      'json',
      'lua',
      'make',
      'markdown',
      'markdown_inline',
      'regex',
      'ruby',
      'sql',
      'terraform',
      'toml',
      'tsx',
      'typescript',
      'vim',
      'vimdoc',
      'yaml',
    },
    highlight = {
      enable = true,
      -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
      --  If you are experiencing weird indenting issues, add the language to
      --  the list of additional_vim_regex_highlighting and disabled languages for indent.
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent = { enable = true, disable = { 'ruby' } },
  },
}
