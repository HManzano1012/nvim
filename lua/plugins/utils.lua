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
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
	},
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
		keys = { "<space>m", "<space>j" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("treesj").setup({})
		end,
	},
	{
		"tris203/precognition.nvim",
		cmd = "Precognition",

		--event = "VeryLazy",
		opts = {
			startVisible = true,
			showBlankVirtLine = true,
			highlightColor = { link = "Comment" },
			hints = {
				Caret = { text = "^", prio = 2 },
				Dollar = { text = "$", prio = 1 },
				MatchingPair = { text = "%", prio = 5 },
				Zero = { text = "0", prio = 1 },
				w = { text = "w", prio = 10 },
				b = { text = "b", prio = 9 },
				e = { text = "e", prio = 8 },
				W = { text = "W", prio = 7 },
				B = { text = "B", prio = 6 },
				E = { text = "E", prio = 5 },
			},
			gutterHints = {
				G = { text = "G", prio = 10 },
				gg = { text = "gg", prio = 9 },
				PrevParagraph = { text = "{", prio = 8 },
				NextParagraph = { text = "}", prio = 8 },
			},
			disabled_fts = {
				"startify",
			},
		},
	},
	{
		"aznhe21/actions-preview.nvim",
		config = function()
			require("actions-preview").setup({
				backend = { "telescope" },
				telescope = vim.tbl_extend(
					"force",
					-- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
					require("telescope.themes").get_ivy(),
					-- a table for customizing content
					{
						-- a function to make a table containing the values to be displayed.
						-- fun(action: Action): { title: string, client_name: string|nil }
						make_value = nil,

						-- a function to make a function to be used in `display` of a entry.
						-- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
						-- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
						make_make_display = nil,
					}
				),
			})
		end,
	},
	{
		"mistricky/codesnap.nvim",
		build = "make",
		opts = {
			save_path = "~/Pictures",
			has_breadcrumbs = true,
			has_line_number = true,
			bg_color = "#A7ADE3",
			watermark = "",
			code_font_family = "VictorMono Nerd Font",
			bg_padding = 20,
		},
	},
	{ "meznaric/key-analyzer.nvim", opts = {} },
	{
		"AdiY00/copy-tree.nvim",
		cmd = "CopyTree",
		config = function()
			require("copy-tree").setup()
		end,
	},
	{ "nvzone/volt", lazy = true },

	-- {
	-- 	"nvzone/minty",
	-- 	cmd = { "Shades", "Huefy" },
	-- },
	{
		"amrbashir/nvim-docs-view",
		lazy = true, -- Load this plugin lazily
		cmd = "DocsViewToggle", -- Command to toggle the documentation view
		opts = {
			position = "right", -- Position the documentation view on the right
			width = 60, -- Set the width of the documentation view
		},
	},
	{
		"philosofonusus/ecolog.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp", -- Optional, for autocompletion support
		},
		-- Optionally reccommend adding keybinds (lsp integration supposed to handle some of them automatically so please check it out)
		opts = {
			-- Enables shelter mode for sensitive values
			-- shelter = {
			-- 	configuration = {
			-- 		partial_mode = true, -- Disables partial mode see shelter configuration below
			-- 		mask_char = "*", -- Character used for masking
			-- 	},
			-- 	modules = {
			-- 		cmp = false, -- Mask values in completion
			-- 		peek = false, -- Mask values in peek view
			-- 		files = false, -- Mask values in files
			-- 		telescope = false, -- Mask values in telescope
			-- 	},
			-- },
			types = {
				-- Built-in types
				url = true, -- URLs (http/https)
				localhost = true, -- Localhost URLs
				ipv4 = true, -- IPv4 addresses
				database_url = true, -- Database connection strings
				number = true, -- Integers and decimals
				boolean = true, -- true/false/yes/no/1/0
				json = true, -- JSON objects and arrays
				iso_date = true, -- ISO 8601 dates (YYYY-MM-DD)
				iso_time = true, -- ISO 8601 times (HH:MM:SS)
				hex_color = true, -- Hex color codes (#RGB or #RRGGBB)

				-- Custom types
				semver = {
					pattern = "^v?(%d+)%.(%d+)%.(%d+)([%-+].+)?$",
					validate = function(value)
						local major, minor, patch = value:match("^v?(%d+)%.(%d+)%.(%d+)")
						return major and minor and patch
					end,
					transform = function(value)
						return value:gsub("^v", "")
					end,
				},

				aws_region = {
					pattern = "^[a-z]{2}%-[a-z]+%-[0-9]$",
					validate = function(value)
						local valid_regions = {
							["us-east-1"] = true,
							["us-west-2"] = true,
							-- ... etc
						}
						return valid_regions[value] == true
					end,
				},
			},
			path = vim.fn.getcwd(), -- Path to search for .env files
			preferred_environment = "development", -- Optional: prioritize specific env files
		},
	},
}

return utils
