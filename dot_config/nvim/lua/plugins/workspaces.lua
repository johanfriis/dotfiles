return {
  {
    "natecraddock/workspaces.nvim",
    config = function()
      require('telescope').load_extensions('workspaces')
    end
  }
}
