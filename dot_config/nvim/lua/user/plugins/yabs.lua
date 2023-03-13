return {
  {
    'shadowofseaice/yabs.nvim',
    opts = {
      position = { 'N' },
      settings = {
        { 'icon', 'name' },
        { 'icon', 'name', 'path' },
      },
      keymap = {
        jump = 'o',
        close = 'd',
      },
      border = 'single',
    },
    config = function(_, opts)
      local yabs = require('yabs')
      yabs.setup(opts)
      yabs.toggleSort('-lastused')
    end,
  },
}
