vim.g.mapleader = ' '

vim.opt.clipboard = 'unnamedplus'

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.local/state/nvim/undodir')

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.textwidth = 80
vim.opt.colorcolumn = '+1'

vim.opt.updatetime = 50

vim.opt.termguicolors = true

vim.cmd([[autocmd BufWritePre * lua require('user.utils').format()]])

-- return cursor to previous location when entering buffer
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
