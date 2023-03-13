local Util = require('lazy.core.util')
local M = {}

M.autoformat = true

function M.toggle_autoformat()
  if vim.b.autoformat == false then
    vim.b.autoformat = nil
    M.autoformat = true
  else
    M.autoformat = not M.autoformat
  end
  if M.autoformat then
    Util.info('Enabled format on save', { title = 'Format' })
  else
    Util.warn('Disabled format on save', { title = 'Format' })
  end
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.format()
  end
end

return M
