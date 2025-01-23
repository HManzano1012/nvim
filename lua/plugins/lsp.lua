local lsp = {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp-config")
		end,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = require("plugins.config.conform-config"),
		setup = function() end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plugins.config.nvim-lint-config")
		end,
	},
}

return lsp
