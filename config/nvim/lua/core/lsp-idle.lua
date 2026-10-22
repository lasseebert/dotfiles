local M = {}

-- Release language servers in idle tmux sessions, start them again when a key is pressed
function M.setup(timeout_ms)
  -- Default is 1 hour timeout
  timeout_ms = timeout_ms or 60 * 60 * 1000

  local servers = {}
  local last_input = vim.uv.now()
  local suspended = false
  local timer = assert(vim.uv.new_timer())
  local namespace = vim.api.nvim_create_namespace('lsp-idle')

  -- After the first hour, we check every 30 seconds if the keyboard was
  -- pressed within the last hour. If not, set suspended mode and stop lsp
  -- servers.
  timer:start(timeout_ms, math.min(timeout_ms, 30000), vim.schedule_wrap(function()
    if not suspended and vim.uv.now() - last_input >= timeout_ms then
      servers = vim.tbl_map(function(config)
        return config.name
      end, vim.lsp.get_configs({ enabled = true }))
      suspended = true
      vim.lsp.enable(servers, false)
    end
  end))

  -- When a key is pressed, record timestamp
  -- If we're suspended, unsuspend and start servers again
  vim.on_key(function()
    last_input = vim.uv.now()
    if suspended then
      suspended = false
      vim.schedule(function()
        vim.lsp.enable(servers)
      end)
    end
  end, namespace)


  vim.api.nvim_create_autocmd('VimLeavePre', {
    once = true,
    callback = function()
      timer:stop()
      timer:close()
      vim.on_key(nil, namespace)
    end,
  })
end

return M
