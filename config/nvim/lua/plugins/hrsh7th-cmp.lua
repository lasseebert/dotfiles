-- Guide from https://elixirforum.com/t/neovim-elixir-setup-configuration-from-scratch-guide/46310
return {
  -- cmp framework for auto-completion support
  'hrsh7th/nvim-cmp',

  -- install different completion source
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',

  -- you need a snippet engine for snippet support
  -- here I'm using vsnip which can load snippets in vscode format
  'hrsh7th/vim-vsnip',
  'hrsh7th/cmp-vsnip',
  config = function()
    local cmp = require('cmp')

    cmp.setup({
      snippet = {
        expand = function(args)
          -- setting up snippet engine
          -- this is for vsnip, if you're using other
          -- snippet engine, please refer to the `nvim-cmp` guide
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        { name = 'buffer' }
      })
    })
  end
}
