return {
  "nvzone/typr",
  dependencies = "nvzone/volt",
  opts = {
    insert_on_start = false,
    wpm_goal = 60,
    on_attach = function(bufnr)
      local api = require("typr.api")
      api.set_linecount(6)
    end,
  },
  cmd = { "Typr", "TyprStats" },
}
