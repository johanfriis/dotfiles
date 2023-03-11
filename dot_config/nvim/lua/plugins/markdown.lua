return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      -- table.insert(opts.sources, nls.builtins.diagnostics.markdownlint)
      -- table.insert(opts.sources, nls.builtins.formatting.cbfmt)
    end,
  },
  -- {
  --   "ixru/nvim-markdown",
  --   branch = "master",
  --   dependencies = {
  --     {
  --       "godlygeek/tabular"
  --     }
  --   },
  --   config = function()
  --   end,
  -- },

  {
    "jakewvincent/mkdnflow.nvim",
    -- rocks = 'luautf8', -- Ensures optional luautf8 dependency is installed
    config = function()
      require('mkdnflow').setup()
    end
  },


  -- {
  --   "mickael-menu/zk-nvim",
  --   config = function()
  --     require("zk").setup()
  --     require("telescope").load_extension("zk")
  --   end
  -- },
  --
  -- {
  --   "renerocksai/telekasten.nvim",
  --   opts = {
  --     home = vim.fn.expand("~/Code/vault/")
  --   },
  --   dependencies = {
  --     {
  --       "renerocksai/calendar-vim",
  --     }
  --   }
  -- },

}