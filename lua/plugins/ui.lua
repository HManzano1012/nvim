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
			local config = require("plugins.config.inline-diagnostics-config")
			require("tiny-inline-diagnostic").setup(config)
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

	-- {
	-- 	"gelguy/wilder.nvim",
	-- 	keys = {
	-- 		":",
	-- 		"/",
	-- 		"?",
	-- 	},
	-- 	dependencies = {
	--
	-- 		"catppuccin/nvim",
	-- 	},
	-- 	config = function()
	-- 		local wilder = require("wilder")
	-- 		local macchiato = require("catppuccin.palettes").get_palette("macchiato")
	--
	-- 		-- Create a highlight group for the popup menu
	-- 		local text_highlight =
	-- 			wilder.make_hl("WilderText", { { a = 1 }, { a = 1 }, { foreground = macchiato.text } })
	-- 		local mauve_highlight =
	-- 			wilder.make_hl("WilderMauve", { { a = 1 }, { a = 1 }, { foreground = macchiato.mauve } })
	-- 		wilder.setup({ modes = { ":", "/", "?" } })
	--
	-- 		-- Enable fuzzy matching for commands and buffers
	-- 		wilder.set_option("pipeline", {
	-- 			wilder.branch(
	-- 				wilder.cmdline_pipeline({
	-- 					fuzzy = 1,
	-- 				}),
	-- 				wilder.vim_search_pipeline({
	-- 					fuzzy = 1,
	-- 				})
	-- 			),
	-- 		})
	--
	-- 		wilder.set_option(
	-- 			"renderer",
	-- 			wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
	-- 				border = "single",
	-- 				left = { " ", wilder.popupmenu_devicons() },
	-- 				right = { " ", wilder.popupmenu_scrollbar() },
	-- 				max_height = "25%", -- max height of the palette
	-- 				max_width = "50%", -- max width of the palette
	-- 				highlighter = wilder.basic_highlighter(),
	-- 				highlights = {
	-- 					default = text_highlight,
	-- 					border = "TelescopeBorder",
	-- 					accent = mauve_highlight,
	-- 				},
	-- 				prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
	-- 			}))
	-- 		)
	-- 	end,
	-- },
}

return ui
