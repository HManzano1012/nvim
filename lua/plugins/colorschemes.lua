local theme = {
	{
		"catppuccin/nvim",
		config = function()
			local config = require("plugins.config.catppuccin-config")
			require("catppuccin").setup(config)
		end,
	},
	{
		"vague2k/vague.nvim",
		config = function()
			require("vague").setup({
				transparent = true, -- don't set background
			})
		end,
	},
}

return theme
