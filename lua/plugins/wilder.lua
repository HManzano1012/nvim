return {
	{
		"gelguy/wilder.nvim",
		enable = true,
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			"catppuccin/nvim",
		},
		config = function()
			local wilder = require("wilder")
			local macchiato = require("catppuccin.palettes").get_palette("macchiato")

			-- Create a highlight group for the popup menu
			local text_highlight =
				wilder.make_hl("WilderText", { { a = 1 }, { a = 1 }, { foreground = macchiato.text } })
			local mauve_highlight =
				wilder.make_hl("WilderMauve", { { a = 1 }, { a = 1 }, { foreground = macchiato.mauve } })
			wilder.setup({ modes = { ":", "/", "?" } })

			-- Enable fuzzy matching for commands and buffers
			wilder.set_option("pipeline", {
				wilder.branch(
					wilder.cmdline_pipeline({
						fuzzy = 1,
					}),
					wilder.vim_search_pipeline({
						fuzzy = 1,
					})
				),
			})

			wilder.set_option(
				"renderer",
				wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
					border = "single",
					left = { " ", wilder.popupmenu_devicons() },
					right = { " ", wilder.popupmenu_scrollbar() },
					max_height = "25%", -- max height of the palette
					max_width = "50%", -- max width of the palette
					highlighter = wilder.basic_highlighter(),
					highlights = {
						default = text_highlight,
						border = "TelescopeBorder",
						accent = mauve_highlight,
					},
					prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
				}))
			)
		end,
	},
}
