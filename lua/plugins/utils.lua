local vim = vim
local utils = {
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = true },
	},
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		opts = {},
		lazy = false,
	},
	{
		"zbirenbaum/copilot.lua",
		enabled = false,
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			local config = require("plugins.config.copilot-config")
			require("copilot").setup(config)
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		event = "BufRead",
		config = function()
			require("autoclose").setup()
		end,
	},
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
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
		event = "BufRead",
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
		event = "BufRead",
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
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local opts = require("plugins.config.obsidian-config")

			require("obsidian").setup(opts)

			vim.cmd("set conceallevel=1")
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
	{
		"ngtuonghy/live-server-nvim",
		cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle", "LiveServerInstall" },
		build = ":LiveServerInstall",
		config = function()
			require("live-server-nvim").setup({})
		end,
	},
	-- {
	-- 	"MeanderingProgrammer/render-markdown.nvim",
	-- 	opts = require("plugins.config.render-markdown"),
	-- 	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	-- },
	{
		"OXY2DEV/markview.nvim",
		-- lazy = false, -- Recommended
		ft = "markdown", -- If you decide to lazy-load anyway

		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local config = require("plugins.config.markview-config")
			require("markview").setup(config)
		end,
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
			vim.cmd("set conceallevel=1")
		end,
	},
	{
		"echasnovski/mini.surround",
		opts = {
			custom_surroundings = nil,
			highlight_duration = 500,
			mappings = {
				add = "sa", -- Add surrounding in Normal and Visual modes
				delete = "sd", -- Delete surrounding
				find = "sf", -- Find surrounding (to the right)
				find_left = "sF", -- Find surrounding (to the left)
				highlight = "sh", -- Highlight surrounding
				replace = "sr", -- Replace surrounding
				update_n_lines = "sn", -- Update `n_lines`

				suffix_last = "l", -- Suffix to search with "prev" method
				suffix_next = "n", -- Suffix to search with "next" method
			},
			n_lines = 20,
			respect_selection_type = false,
			search_method = "cover",
			silent = false,
		},
	},
	{
		"Wansmer/treesj",
		keys = {
			"<space>m",
			"<space>j",
			"<space>s",
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
}

return utils
