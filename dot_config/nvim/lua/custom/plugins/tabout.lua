return {
  "abecodes/tabout.nvim",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("tabout").setup({
      act_as_shift_tab = true,
      completion = false,
    })
  end,
}
