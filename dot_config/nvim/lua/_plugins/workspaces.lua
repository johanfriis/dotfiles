return {
  {
    "natecraddock/workspaces.nvim",
    -- dependencies = {
    --   "nvim-telescope/telescope.nvim",
    -- },
    config = function()
      require('telescope').load_extension('workspaces')
    end
  }
}
