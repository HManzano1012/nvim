local vim = vim
local utils = {
	{
		"numToStr/Comment.nvim",
		event = "BufRead",
		opts = {},
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{
		"folke/which-key.nvim", -- Load the which-key plugin
		-- optional = true, -- This plugin is optional
		opts = require("plugins.config.whichkey-config"),
	},
	{
		"m4xshen/autoclose.nvim",
		event = "BufRead",
		config = function()
			require("autoclose").setup()
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
				render = "virtual",
				virtual_symbol = " ",
				---Highlight hex colors, e.g. '#FFFFFF'
				enable_hex = true,

				---Highlight short hex colors e.g. '#fff'
				enable_short_hex = true,

				---Highlight rgb colors, e.g. 'rgb(0 0 0)'
				enable_rgb = true,

				---Highlight hsl colors, e.g. 'hsl(150deg 30% 40%)'
				enable_hsl = true,

				---Highlight CSS variables, e.g. 'var(--testing-color)'
				enable_var_usage = true,

				---Highlight named colors, e.g. 'green'
				enable_named_colors = true,

				---Highlight tailwind colors, e.g. 'bg-blue-500'
				enable_tailwind = true,
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
		"OXY2DEV/markview.nvim",
		-- lazy = false, -- Recommended
		ft = { "markdown", "Avante" }, -- If you decide to lazy-load anyway
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
	-- {
	-- 	"aznhe21/actions-preview.nvim",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("actions-preview").setup({
	-- 			backend = { "telescope" },
	-- 			telescope = vim.tbl_extend(
	-- 				"force",
	-- 				-- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
	-- 				require("telescope.themes").get_ivy(),
	-- 				-- a table for customizing content
	-- 				{
	-- 					-- a function to make a table containing the values to be displayed.
	-- 					-- fun(action: Action): { title: string, client_name: string|nil }
	-- 					make_value = nil,
	--
	-- 					-- a function to make a function to be used in `display` of a entry.
	-- 					-- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
	-- 					-- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
	-- 					make_make_display = nil,
	-- 				}
	-- 			),
	-- 		})
	-- 	end,
	-- },
	-- {
	-- 	"sindrets/diffview.nvim",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("diffview").setup()
	-- 	end,
	-- },
	-- {
	-- 	"philosofonusus/ecolog.nvim",
	-- 	cmd = { "EcologGoto", "EcologPeek", "EcologSelect" },
	-- 	dependencies = {
	-- 		"hrsh7th/nvim-cmp", -- Optional, for autocompletion support
	-- 	},
	-- 	opts = {
	-- 		integrations = {
	-- 			nvim_cmp = true, -- If you dont plan to use nvim_cmp set to false, enabled by default
	-- 		},
	-- 		provider_patterns = {
	-- 			extract = false, -- Extract any word as potential var
	-- 			cmp = true, -- Complete anywhere
	-- 		},
	--
	-- 		-- path = vim.fn.getcwd(), -- Path to search for .env files
	-- 		-- preferred_environment = "development", -- Optional: prioritize specific env files
	-- 	},
	-- },
	{
		"folke/snacks.nvim",
		opts = {
			bigfile = {
				notify = true, -- show notification when big file detected
				size = 3 * 1024 * 1024, -- 1.5MB
				line_length = 1000, -- average line length (useful for minified files)
			},
		},
	},
	{
		"kopecmaciej/vi-mongo.nvim",
	},
}

return utils
