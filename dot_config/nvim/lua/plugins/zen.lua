return {
  "folke/zen-mode.nvim",
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
  },
  dependencies = {
    {
      "folke/twilight.nvim",
      config = true,
    }
  }
}
