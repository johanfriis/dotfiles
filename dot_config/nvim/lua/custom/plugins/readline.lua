return {
  "linty-org/readline.nvim",
  config = function()
    local readline = require 'readline'

    vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
    vim.keymap.set('!', '<C-e>', readline.end_of_line)
    vim.keymap.set('!', '<C-f>', '<Right>')
    vim.keymap.set('!', '<C-b>', '<Left>')
  end,
}
