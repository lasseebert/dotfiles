vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })

local treesitter = require('nvim-treesitter')

local parsers = {
  'bash',
  'cmake',
  'css',
  'diff',
  'dockerfile',
  'elixir',
  'gitignore',
  'graphql',
  'html',
  'javascript',
  'json',
  'lua',
  'luadoc',
  'make',
  'markdown',
  'markdown_inline',
  'query',
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
}

treesitter.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

treesitter.install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start)

    if not vim.list_contains({ 'elixir', 'ruby' }, args.match) then
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
