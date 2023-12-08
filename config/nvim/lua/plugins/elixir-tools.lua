return {
  {
    "elixir-tools/elixir-tools.nvim",
    version = "*",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local elixir = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup {
        nextls = {enable = false},
        credo = {},
        elixirls = {
          enable = true,
          settings = elixirls.settings {
            dialyzerEnabled = true,
            enableTestLenses = false,
          },
          on_attach = function(client, bufnr)
            opts = { buffer = true, noremap = true }

            -- Navigation
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

            -- Show docs
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

            -- Format
            vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, opts)

            -- Navigate errors
            vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<leader>dp", vim.diagnostic.goto_prev, opts)

            -- Show expanded macro in floating window
            vim.keymap.set("v", "<leader>em", ":ElixirExpandMacro<cr>", opts)
          end,
        }
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  -- Workaround for indent that is not working with Elixir
  {"elixir-editors/vim-elixir"},

}
