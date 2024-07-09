local lsp = {
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.config.lsp-config")
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = require("plugins.config.comform-config"),
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("plugins.config.nvim-lint-config")
		end,
	},
}

return lsp
