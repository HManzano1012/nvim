local theme = {
	{
		"catppuccin/nvim",
		config = function()
			local config = require("plugins.config.catppuccin-config")
			require("catppuccin").setup(config)
			vim.cmd.colorscheme("catppuccin-macchiato")
		end,
	},
	{
		"mcauley-penney/phobos-anomaly.nvim",
		priority = 1000,
		init = function()
			vim.cmd.colorscheme("phobos-anomaly")
		end,
	},
	{
		"zenbones-theme/zenbones.nvim",
	},
}

return theme
