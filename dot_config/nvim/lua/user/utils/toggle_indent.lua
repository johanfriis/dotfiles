local blank = require('indent_blankline')

local M = {}

function M.toggle_indent(state)
  vim.g.indent_blankline_enabled = (state or not vim.g.indent_blankline_enabled)
  vim.g.miniindentscope_disable = (not state or not vim.g.miniindentscope_disable)

  blank.refresh()
end

return M
