local map = vim.keymap.set
local Utils = require('user.utils')

-- better up/down
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- move lines up and down
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

-- better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- yank till end of line
map('n', 'Y', 'yg$')

-- join lines and stay at cursor
map('n', 'J', 'mzJ`z')

-- scroll while centering cursor
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-f>', '<C-f>zz')
map('n', '<C-b>', '<C-b>zz')

-- next match while centering cursor
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- replace selection without loosing yanked text
map('x', '<leader>p', '"_dP')

-- delete to nothing
map({ 'n', 'v' }, '<leader>d', '"_d')

-- disable capital Q
map({ 'n' }, 'Q', '<nop>')

-- highlights under cursor
if vim.fn.has('nvim-0.9.0') == 1 then
  map('n', '<leader>xi', vim.show_pos, { desc = 'Inspect Pos' })
end

vim.keymap.set('n', '§', ':YABSOpen<cr>')

-- ----------------------------
-- Which Key Mappings
-- ----------------------------

local which = require('which-key')

which.register({
  mode = { 'n', 'v' },
  ['g'] = { name = '+goto' },
  ['S'] = { name = '+surround' },
})

-- ----------------------------
-- +toggle
-- ----------------------------
which.register({
  ['<leader>t'] = {
    name = '+toggle',
    e = { ':Neotree toggle<cr>', 'Neotree' },
    f = { [[:lua require('user.utils').toggle_autoformat()<cr>]], 'Autoformat' },
    z = { ':ZenMode<cr>', 'Zen Mode' },
    l = {
      [[:lua require('user.utils').toggle_indent()<cr>]],
      'Toggle Indent Lines',
    },
  },
})

-- ----------------------------
-- +search
-- ----------------------------
which.register({
  ['<leader>s'] = {
    name = '+search',
    [':'] = { '<cmd>Telescope command_history<cr>', 'Command History' },
    b = { '<cmd>Telescope buffers<cr>', 'Buffer' },
    f = { Utils.telescope('files'), 'File (root)' },
    F = { Utils.telescope('files', { cwd = false }), 'File (cwd)' },
    s = { Utils.telescope('live_grep'), 'In Files' },
  },
})

-- search for word under cursor
-- This does not work when added inside register
map(
  'n',
  '<leader>sw',
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Word under Cursor' }
)

-- ----------------------------
-- +buffer
-- ----------------------------
which.register({
  ['<leader>b'] = {
    name = '+buffer',
    d = { '<cmd>bp|bd#<cr>', 'Delete Buffer' },
    L = { '<cmd>Luapad<cr>', 'New Luapad' },
  },
})

-- ----------------------------
-- +workspace
-- ----------------------------
which.register({
  ['<leader>w'] = {
    name = '+workspace',
    p = { '<cmd>Telescope projects<cr>', 'Open Project' },
    r = { [[<cmd>lua require("persistence").load()<cr>]], 'Restore Session' },
  },
})

local lsp = require('lsp-zero')

lsp.on_attach(function(_, bn)
  local buf = vim.lsp.buf
  local diag = vim.diagnostic

  which.register({
    ['<leader>c'] = {
      name = '+code',
      a = { buf.code_action, 'Code Action', buffer = bn },
      c = {
        '<cmd>TroubleToggle document_diagnostics<cr>',
        'Document Diagnostics',
        buffer = bn,
      },
      C = {
        '<cmd>TroubleToggle workspace_diagnostics<cr>',
        'Workspace Diagnostics',
        buffer = bn,
      },
      d = { diag.open_float, 'Floating diagnostics', buffer = bn },
      f = { buf.format, 'Format', buffer = bn },
      i = {
        '<cmd>TroubleToggle lsp_implementations<cr>',
        'Implementations',
        buffer = bn,
      },
      r = { buf.rename, 'Rename', buffer = bn },
      s = { buf.workspace_symbol, 'List Symbols', buffer = bn },
      t = { buf.type_definition, 'Goto Type Definition', buffer = bn },
      q = { '<cmd>TroubleToggle quickfix<cr>', 'Quickfix List', buffer = bn },
      l = { '<cmd>TroubleToggle loclist<cr>', 'Location List', buffer = bn },
    },
  })

  map(
    'n',
    'gd',
    '<cmd>TroubleToggle lsp_definitions<cr>',
    { buffer = bn, desc = 'Definitions' }
  )
  map(
    'n',
    'gr',
    '<cmd>TroubleToggle lsp_references<cr>',
    { buffer = bn, desc = 'References' }
  )
  map('n', 'K', buf.hover, { buffer = bn, desc = 'Hover' })
  map('n', '[d', diag.goto_next, { buffer = bn, desc = 'Goto Next' })
  map('n', ']d', diag.goto_prev, { buffer = bn, desc = 'Goto Prev' })
  map(
    'n',
    '<C-h>',
    buf.signature_help,
    { buffer = bn, desc = 'Signature Help' }
  )
end)
