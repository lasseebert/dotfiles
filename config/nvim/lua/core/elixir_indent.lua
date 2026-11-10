local M = {}

-- nvim-treesitter normally indents a continued `with` clause by one
-- shiftwidth instead of aligning it with the first clause, as `mix format`
-- does. This cannot be fixed only with an `indents.scm` alignment capture:
-- when Enter is pressed after the first clause, Tree-sitter still sees the
-- `with` call as a single-line node and the indentation engine deliberately
-- skips alignment for such nodes. Detect that specific continuation here and
-- delegate every other indentation decision to nvim-treesitter.
local function with_continuation_indent(bufnr, lnum)
  local previous_lnum = vim.fn.prevnonblank(lnum - 1)
  if previous_lnum == 0 then
    return nil
  end

  local previous_line = vim.api.nvim_buf_get_lines(bufnr, previous_lnum - 1, previous_lnum, false)[1]
  local comma_col = previous_line and previous_line:find(',%s*$')
  if not comma_col then
    return nil
  end

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, 'elixir')
  if not ok or not parser then
    return nil
  end

  local tree = parser:parse()[1]
  if not tree then
    return nil
  end

  local node = tree:root():descendant_for_range(previous_lnum - 1, comma_col - 1, previous_lnum - 1, comma_col)
  while node and node:type() ~= 'arguments' do
    node = node:parent()
  end

  if not node then
    return nil
  end

  local call = node:parent()
  if not call or call:type() ~= 'call' then
    return nil
  end

  local target = call:field('target')[1]
  if not target or vim.treesitter.get_node_text(target, bufnr) ~= 'with' then
    return nil
  end

  local _, with_col = target:start()
  return with_col + #'with '
end

function M.indentexpr()
  return with_continuation_indent(0, vim.v.lnum)
    or require('nvim-treesitter').indentexpr()
end

return M
