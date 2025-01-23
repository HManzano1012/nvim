local vim = vim
local ui = {
	{
		"stevearc/oil.nvim",
		cmd = "Oil",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local config = require("plugins.config.oil-config")
			require("oil").setup(config)
		end,
	},
	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"meuter/lualine-so-fancy.nvim",
			"AndreM222/copilot-lualine",
		},
		config = function()
			local config = require("plugins.config.lualine-config")
			require("lualine").setup(config)
		end,
	},
	{
		"utilyre/barbecue.nvim",
		event = "BufRead",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
		},
		opts = {},
	},
	{
		"folke/noice.nvim",
		version = "4.2.1",
		dependencies = {
			"muniftanjim/nui.nvim",
		},
		config = function()
			local config = require("plugins.config.noice-config")
			local noice = require("noice")
			noice.setup(config)
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "BufRead",
		config = function()
			-- Default configuration
			require("tiny-inline-diagnostic").setup({
				preset = "classic", -- Can be: "modern", "classic", "minimal", "powerline", ghost", "simple", "nonerdfont", "amongus"
				signs = {
					left = "",
					right = "",
					diag = " ",
					arrow = "   ",
					up_arrow = "    ",
					vertical = " │",
					vertical_end = " └",
				},
				hi = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
					arrow = "NonText",
					background = "CursorLine", -- Can be a highlight or a hexadecimal color (#RRGGBB)
					mixing_color = "None", -- Can be None or a hexadecimal color (#RRGGBB). Used to blend the background color with the diagnostic background color with another color.
				},
				options = {
					-- Show the source of the diagnostic.
					show_source = false,

					-- Use your defined signs in the diagnostic config table.
					use_icons_from_diagnostic = false,

					-- Add messages to the diagnostic when multilines is enabled
					add_messages = true,

					-- Throttle the update of the diagnostic when moving cursor, in milliseconds.
					-- You can increase it if you have performance issues.
					-- Or set it to 0 to have better visuals.
					throttle = 20,

					-- The minimum length of the message, otherwise it will be on a new line.
					softwrap = 30,

					-- If multiple diagnostics are under the cursor, display all of them.
					multiple_diag_under_cursor = false,

					-- Enable diagnostic message on all lines.
					-- Can either be a boolean or a table with the following options:
					--  multilines = {
					-- 	-- Enable the multilines feature
					-- 	enabled = false,
					--
					-- 	-- Always show diagnostic messages on all lines
					--  	always_show = false,
					--  }
					--
					-- If it is a boolean set as true, it will enable the feature with the default options:
					--  multilines = {
					-- 	enabled = true,
					-- 	always_show = false,
					-- }

					multilines = {
						enabled = false,
						always_show = false,
					},

					-- Show all diagnostics on the cursor line.
					show_all_diags_on_cursorline = false,

					-- Enable diagnostics on Insert mode. You should also se the `throttle` option to 0, as some artefacts may appear.
					enable_on_insert = false,

					overflow = {
						-- Manage the overflow of the message.
						--    - wrap: when the message is too long, it is then displayed on multiple lines.
						--    - none: the message will not be truncated.
						--    - oneline: message will be displayed entirely on one line.
						mode = "wrap",
					},

					-- Format the diagnostic message.
					-- Example:
					-- format = function(diagnostic)
					--     return diagnostic.message .. " [" .. diagnostic.source .. "]"
					-- end,
					format = nil,

					--- Enable it if you want to always have message with `after` characters length.
					break_line = {
						enabled = false,
						after = 30,
					},

					virt_texts = {
						priority = 2048,
					},

					-- Filter by severity.
					severity = {
						vim.diagnostic.severity.ERROR,
						vim.diagnostic.severity.WARN,
						vim.diagnostic.severity.INFO,
						vim.diagnostic.severity.HINT,
					},

					-- Overwrite events to attach to a buffer. You should not change it, but if the plugin
					-- does not works in your configuration, you may try to tweak it.
					overwrite_events = nil,
				},
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
		"lukas-reineke/virt-column.nvim",
		event = "BufRead",
		opts = {
			char = { "│" },
			vircolumn = { vim.opt.colorcolumn },
			highlight = { "IblIndent" },
		},
	},
	{
		"goolord/alpha-nvim",
		enabled = true,
		lazy = false,
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Set header
			dashboard.section.header.val = {
				"                            ",
				"     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
				"   ▄▀███▄     ▄██ █████▀    ",
				"   ██▄▀███▄   ███           ",
				"   ███  ▀███▄ ███           ",
				"   ███    ▀██ ███           ",
				"   ███      ▀ ███           ",
				"   ▀██ █████▄▀█▀▄██████▄    ",
				"    ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀    ",
				"     Powered By  eovim    ",
				"                            ",
			}
			dashboard.section.buttons.val = {
				dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
				dashboard.button("f", "  > Find file", ":cd $HOME/Workspace | Telescope find_files<CR>"),
				dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
				dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
				dashboard.button("q", "  > Quit NVIM", ":qa<CR>"),
			}
			dashboard.section.header.opts.hl = "fg_lavender"

			alpha.setup(dashboard.opts)
			-- vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])
		end,
	},
	{ "LudoPinelli/comment-box.nvim" },
}

return ui
