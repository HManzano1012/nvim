local theme = {
	{
		"catppuccin/nvim",
		config = function()
			local config = require("plugins.config.catppuccin-config")
			require("catppuccin").setup(config)
		end,
	},
}

return theme
