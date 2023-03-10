vim.g.mapleader = " "

require("config.remap")

vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.scrolloff = 4 -- Lines of context
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.termguicolors = true -- Enable 24bit colour
vim.opt.wrap = false -- Disable line wrap
