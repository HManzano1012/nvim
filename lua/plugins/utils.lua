local utils = {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},
	{
		"numToStr/Comment.nvim",
		opts = {},
		lazy = false,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			local config = require("plugins.config.copilot-config")
			require("copilot").setup(config)
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		enabled = true,
		config = function()
			require("autoclose").setup()
		end,
	},
	{
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
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
				render = "background",
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
			local theme_colors = require("catppuccin.palettes").get_palette("macchiato")
			require("tiny-devicons-auto-colors").setup({
				colors = theme_colors,
			})
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		cmd = { "ObsidianQuickSwitch", "ObsidianNew", "ObsidianBacklinks" },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = require("plugins.config.obsidian-config"),
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	{
		"ngtuonghy/live-server-nvim",
		event = "VeryLazy",
		build = ":LiveServerInstall",
		config = function()
			require("live-server-nvim").setup({})
		end,
	},
	{
		"rest-nvim/rest.nvim",
		cmd = "Rest",
	},
}

return utils
