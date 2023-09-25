return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end, { desc = "Open Trouble" })
    vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end, { desc = "Open Workspace Diagnostics in Trouble" })
    vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end, { desc = "Open Document Diagnostics in Trouble" })
    vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end, { desc = "Open Quickfix in Trouble" })
    vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end, { desc = "Open Location List in Trouble" })
    vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end, { desc = "Open LSP References in Trouble" })
  end,
}
