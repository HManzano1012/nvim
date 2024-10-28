local git = {
	{
		"kdheepak/lazygit.nvim",
		cmd = "LazyGit",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			vim.g.lazygit_floating_window_border_chars = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }
		end,
	},
	{
		"akinsho/git-conflict.nvim",
		event = "BufRead",
		version = "*",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			local config = require("plugins.config.gitsigns-config")
			require("gitsigns").setup(config)
		end,
	},
}

return git
