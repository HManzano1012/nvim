local utils = {
	{
		"m4xshen/autoclose.nvim",
		enabled = true,
		config = function()
			require("autoclose").setup()
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({
				mapping = { "jk", "jj" },
				timeout = vim.o.timeoutlen,
			})
		end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		enabled = true,
		lazy = false,
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		enabled = true,
		config = function()
			require("nvim-highlight-colors").setup({
				render = "virtual",
				virtual_symbol = "  ",
				enable_tailwind = true,
			})
		end,
	},
	{
		"rachartier/tiny-devicons-auto-colors.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		event = "VeryLazy",
		config = function()
			local theme_colors = require("catppuccin.palettes").get_palette("mocha")

			require("tiny-devicons-auto-colors").setup({
				colors = theme_colors,
			})
		end,
	},
}

return utils
