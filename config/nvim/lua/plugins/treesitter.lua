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
  'heex',
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

local disable_treesitter_indent = {
  elixir = true,
  ruby = true,
}

local additional_vim_regex_highlighting = {
  ruby = true,
}

treesitter.setup({
  install_dir = vim.fn.stdpath('data') .. '/site',
})

treesitter.install(parsers)

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)

    if additional_vim_regex_highlighting[args.match] then
      vim.bo[args.buf].syntax = 'ON'
    end

    if not disable_treesitter_indent[args.match] then
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end
  end,
})

-- There are additional nvim-treesitter modules that you can use to interact
-- with nvim-treesitter. You should go explore a few and see what interests you:
--
--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
