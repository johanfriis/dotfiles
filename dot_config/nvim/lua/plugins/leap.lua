return {
  {
    "ggandor/leap.nvim",
    keys = require('config.keys').leap,
    opts = {
      special_keys = {
        next_group = '<tab>',
        prev_group = '<S-tab>'

      },
    },
    config = function(_, opts)
      local leap = require("leap")
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
}
