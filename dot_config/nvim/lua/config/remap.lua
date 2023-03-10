local Utils = require("utils")

-- better up/down
Utils.map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
Utils.map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move Lines
Utils.map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
Utils.map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
Utils.map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
Utils.map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
Utils.map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
Utils.map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
Utils.map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- better indenting
Utils.map("v", "<", "<gv")
Utils.map("v", ">", ">gv")

-- new file
Utils.map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })

Utils.map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
Utils.map("n", "<leader>xq", "<cmd>copen<cr>", { desc = "Quickfix List" })

if not Utils.has("trouble.nvim") then
	Utils.map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
	Utils.map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })
end

-- toggle options
Utils.map("n", "<leader>uf", require("lazyvim.plugins.lsp.format").toggle, { desc = "Toggle format on Save" })
Utils.map("n", "<leader>us", function()
	Utils.toggle("spell")
end, { desc = "Toggle Spelling" })
Utils.map("n", "<leader>uw", function()
	Utils.toggle("wrap")
end, { desc = "Toggle Word Wrap" })
Utils.map("n", "<leader>ul", function()
	Utils.toggle("relativenumber", true)
	Utils.toggle("number")
end, { desc = "Toggle Line Numbers" })
Utils.map("n", "<leader>ud", Utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
local conceallevel = vim.o.conceallevel > 0 and vim.o.conceallevel or 3
Utils.map("n", "<leader>uc", function()
	Utils.toggle("conceallevel", false, { 0, conceallevel })
end, { desc = "Toggle Conceal" })

-- lazygit
Utils.map("n", "<leader>gg", function()
	Utils.float_term({ "lazygit" }, { cwd = Utils.get_root() })
end, { desc = "Lazygit (root dir)" })
Utils.map("n", "<leader>gG", function()
	Utils.float_term({ "lazygit" })
end, { desc = "Lazygit (cwd)" })

-- quit
Utils.map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
	Utils.map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

-- windows
Utils.map("n", "<leader>ww", "<C-W>p", { desc = "Other window" })
Utils.map("n", "<leader>wd", "<C-W>c", { desc = "Delete window" })
Utils.map("n", "<leader>w-", "<C-W>s", { desc = "Split window below" })
Utils.map("n", "<leader>w|", "<C-W>v", { desc = "Split window right" })
Utils.map("n", "<leader>-", "<C-W>s", { desc = "Split window below" })
Utils.map("n", "<leader>|", "<C-W>v", { desc = "Split window right" })
