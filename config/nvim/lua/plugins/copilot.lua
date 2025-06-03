-- Copilot is configured using a community plugin. This just changes a few configs.

return {
  "zbirenbaum/copilot.lua",
  opts = {
    filetypes = {
      yaml = true,
      markdown = true,
      help = false,
      gitcommit = true,
      gitrebase = true,
      hgcommit = false,
      svn = false,
      cvs = false,
      ["."] = false,
    },
  }
}
