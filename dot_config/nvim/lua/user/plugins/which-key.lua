return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = {
        spelling = true -- show suggestions on z=
      },
      -- ignore_missing = true,
    },
    config = function(_, opts)

      vim.opt.timeout = true
      vim.opt.timeoutlen = 300

      require("which-key").setup(opts)
    end,
  }
}
