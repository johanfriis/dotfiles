return {
  "folke/zen-mode.nvim",
  cmd = 'ZenMode',
  opts = {
    window = {
      backdrop = 1,
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
        cursorline = false,
        cursorcolumn = false,
        foldcolumn = "0",
        list = false,
      }
    },
    on_open = function()
      require('user.utils').toggle_indent(false)
    end,
    on_close = function()
      require('user.utils').toggle_indent(true)
    end,
  },
}
