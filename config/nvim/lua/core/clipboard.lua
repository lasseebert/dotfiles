-- On Fedora/GNOME/Wayland, wl-copy/wl-paste can cause Pop Shell to briefly
-- retile kitty when deletes and puts touch the clipboard. Use kitty's OSC52
-- support instead, and satisfy paste from Neovim's own cache when possible.
local osc52 = require('vim.ui.clipboard.osc52')
local clipboard_cache = {}

vim.api.nvim_create_autocmd('FocusGained', {
  callback = function()
    clipboard_cache = {}
  end,
})

local function clipboard_copy(reg)
  local osc52_copy = osc52.copy(reg)

  return function(lines, regtype)
    clipboard_cache[reg] = { lines, regtype }
    osc52_copy(lines)
  end
end

local function clipboard_paste(reg)
  local osc52_paste = osc52.paste(reg)

  return function()
    if clipboard_cache[reg] then
      return clipboard_cache[reg]
    end

    local lines = osc52_paste()
    return { lines, 'v' }
  end
end

vim.g.clipboard = {
  name = 'OSC52 cached',
  copy = {
    ['+'] = clipboard_copy('+'),
    ['*'] = clipboard_copy('*'),
  },
  paste = {
    ['+'] = clipboard_paste('+'),
    ['*'] = clipboard_paste('*'),
  },
  cache_enabled = 0,
}
