-- https://github.com/epwalsh/pomo.nvim
return {
  'epwalsh/pomo.nvim',
  dependencies = {
    "rcarriga/nvim-notify",
  },
  version = "*",
  config = function()
    require("pomo").setup({
      notifiers = {
        -- nvim-notify
        {
          name = "Default",
          opts = {
            sticky = false,
            title_icon = "⏳",
            text_icon = "⏱️",
          },
        },

        -- Requires the `libnotify-bin` package on Linux.
        { name = "System" },
      },

    })

    -- Set up keymaps for the plugin
    vim.keymap.set("n", "<leader>pp", ":TimerStart 25m Work<cr>", { desc = "Start Pomodoro" })
    vim.keymap.set("n", "<leader>ps", ":TimerShow<cr>", { desc = "Show Pomodoro Status" })
    vim.keymap.set("n", "<leader>ph", ":TimerHide<cr>", { desc = "Hide Pomodoro Status" })
    vim.keymap.set("n", "<leader>pq", ":TimerStop<cr>", { desc = "Quit Pomodoro" })
  end
}
