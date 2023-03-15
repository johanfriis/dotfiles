local Utils = require('user.utils')

local hexa = '0123456789abcdef'

local hex = Utils.random_string(6, hexa)

return {
  {
    'jakewvincent/mkdnflow.nvim',
    opts = {
      mappings = {
        MkdnToggleToDo = { { 'n', 'v' }, '<C-Enter>' },
        MkdnFoldSection = false,
        MkdnUnfoldSection = false,
      },
      modules = {
        bib = false,
      },
      perspective = {
        priority = 'root',
        root_tell = '.git',
        fallback = 'current',
      },
      links = {
        style = 'wiki',
        conceal = true,
        implicit_extension = 'md',
        transform_explicit = function(_)
          return Utils.random_string(6, hexa)
        end,
        transform_implicit = function(text)
          print(text)
          return text
        end,
      },
    },
  },
  -- {
  --   'ellisonleao/glow.nvim',
  --   cmd = 'Glow',
  --   opts = {
  --     width_ratio = 0.9,
  --     height_ratio = 0.9,
  --     pager = true,
  --     border = 'single',
  --   },
  --   config = true,
  -- },
  {
    'mickael-menu/zk-nvim',
    config = function()
      require('zk').setup({
        picker = 'telescope',
        lsp = {
          config = {
            cmd = { 'zk', 'lsp' },
            name = 'zk',
          },
          auto_attach = {
            enabled = true,
            filetypes = { 'markdown' },
          },
        },
      })
    end,
  },
  -- { 'jghauser/follow-md-links.nvim' },
  -- {
  --   'renerocksai/telekasten.nvim',
  --   dependencies = { 'nvim-telescope/telescope.nvim' },
  --   config = function()
  --     require('telekasten').setup({
  --       home = vim.fn.expand('~/Slipbox/home'),
  --       take_over_my_home = true,
  --       new_note_filename = 'uuid',
  --       uuid_type = hex,
  --       image_link_style = 'wiki',
  --       sort = 'modified'
  --     })
  --   end,
  -- },
}
