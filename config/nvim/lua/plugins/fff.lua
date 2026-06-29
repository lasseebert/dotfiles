-- Fast file and content search
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then
        vim.cmd.packadd('fff.nvim')
      end

      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })

local fff_download = require('fff.download')
local fff_binary = fff_download.get_binary_path()
local fff_binary_stat = vim.uv.fs_stat(fff_binary)

if not fff_binary_stat or fff_binary_stat.type ~= 'file' then
  fff_download.download_or_build_binary()
end

require('fff').setup({
  layout = {
    height = 0.95,
    width = 0.95,
    preview_position = 'top',
  },
  keymaps = {
    close = '<Esc>',
    select = '<CR>',
    select_split = '<C-s>',
    select_vsplit = '<C-v>',
    select_tab = '<C-t>',
    move_up = { '<C-k>', '<Up>' },
    move_down = { '<C-j>', '<Down>' },
    preview_scroll_up = '<C-u>',
    preview_scroll_down = '<C-d>',
    toggle_debug = '<F2>',
    cycle_grep_modes = '<S-Tab>',
    grep_jump_to_next_file = { '<C-A-n>', '<A-Down>' },
    grep_jump_to_prev_file = { '<C-A-p>', '<A-Up>' },
    cycle_previous_query = '<C-p>',
    cycle_forward_query = '<C-n>',
    toggle_select = '<Tab>',
    send_to_quickfix = '<C-q>',
    focus_list = '<leader>l',
    focus_preview = '<leader>p',
  },
})

vim.keymap.set('n', '<leader>sf', function()
  require('fff').find_files()
end, { desc = '[S]earch [F]iles' })

vim.keymap.set('n', '<C-p>', function()
  require('fff').find_files()
end, { desc = '[ ] Search Files' })

vim.keymap.set('n', '<leader>sw', function()
  require('fff').live_grep({ query = vim.fn.expand('<cword>') })
end, { desc = '[S]earch current [W]ord' })

vim.keymap.set('n', '<leader>sg', function()
  require('fff').live_grep()
end, { desc = '[S]earch by [G]rep' })

vim.keymap.set('n', '<leader>sn', function()
  require('fff').find_files_in_dir(vim.fn.stdpath('config'))
end, { desc = '[S]earch [N]eovim files' })
