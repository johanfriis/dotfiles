return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				require("rose-pine").setup({
					variant = "auto",
				})
				vim.cmd("colorscheme rose-pine")
			end,
		},
	},
}
