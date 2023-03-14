local Utils = require("user.utils")
local Icons = require("user.config.icons")

return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
		config = function()
			local lsp = require("lsp-zero")
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			lsp.preset({
				name = "recommended",
				sign_icons = {
					error = Icons.diagnostics.Error,
					warn = Icons.diagnostics.Warn,
					hint = Icons.diagnostics.Hint,
					info = Icons.diagnostics.Info,
				},
			})

			lsp.ensure_installed({
				"tsserver",
				"eslint",
				"lua_ls",
				"prettierd",
			})

			local supertab = function(fallback)
				if cmp.visible() then
					cmp.confirm({ select = true })
				elseif luasnip.expand_or_locally_jumpable() then
					luasnip.expand_or_jump()
				elseif Utils.has_words_before() then
					cmp.complete()
				else
					fallback()
				end
			end

			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			lsp.setup_nvim_cmp({
				mapping = lsp.defaults.cmp_mappings({
					["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
					["<Tab>"] = cmp.mapping(supertab),
				}),
			})

			-- setup lua for working in nvim
			lsp.nvim_workspace({
				library = vim.api.nvim_get_runtime_file("", true),
			})

			lsp.setup()
		end,
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "williamboman/mason.nvim" },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local nls = require("null-ls")
			nls.setup({
				root_dir = require("null-ls.utils").root_pattern(".git"),
				sources = {
					nls.builtins.formatting.fish_indent,
					nls.builtins.diagnostics.fish,
					nls.builtins.formatting.stylua,
					nls.builtins.formatting.prettierd,
				},
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
}
