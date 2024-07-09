local theme = {
	{
		"catppuccin/nvim",
		config = function()
			local config = require("plugins.config.catppuccin-config")
			require("catppuccin").setup(config)

			--		require("lspconfig.ui.windows").default_options.border = "single"
		end,
	},
}

return theme

