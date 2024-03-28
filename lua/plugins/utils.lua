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
		enable = true,
		lazy = false,
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")

			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"backdround/global-note.nvim",
		config = function()
			local global_note = require("global-note")
			global_note.setup({
				filename = "global.md",
				directory = "~/Obsidian/notes/",
			})
		end,
	},
}

return utils
