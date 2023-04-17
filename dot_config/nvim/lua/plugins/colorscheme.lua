return {
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				require("rose-pine").setup({
					variant = "auto",
				})
			end,
		},
	},
}
