local lspconfig = {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("config.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"eslint-lsp",
				"prettierd",
				"tailwindcss-language-server",
				"typescript-language-server",
				"gopls",
				"black",
				"mypy",
				"ruff",
				"pyright",
				"phpactor",
				"intelephense",
				"stylua",
				"dockerls",
			},
		},
	},
	{
		"nvimtools/none-ls.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
		opts = function()
      local opts = require("config.null-ls")
      return opts
		end,
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
}

return lspconfig
