return {
  {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    opts = { delay = 200 },
    keys = require('config.keys').illuminate,
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },
}
