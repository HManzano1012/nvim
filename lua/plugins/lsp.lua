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
			auto_install = true,
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
		"folke/trouble.nvim",
		cmd = { "TroubleToggle", "Trouble", "TodoTrouble" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			position = "right",
		},
	},
}

return lspconfig
