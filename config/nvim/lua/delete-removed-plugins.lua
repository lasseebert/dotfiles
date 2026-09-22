-- vim.pack restores and repairs plugins from both the lock file and local disk, but
-- pulling a config that removed a plugin does not delete its existing checkout.
-- Run this after all vim.pack.add() calls so Git removals propagate across machines.
local removed_plugins = vim.iter(vim.pack.get(nil, { info = false }))
  :filter(function(plugin)
    return not plugin.active
  end)
  :map(function(plugin)
    return plugin.spec.name
  end)
  :totable()

if #removed_plugins > 0 then
  vim.pack.del(removed_plugins)
end
