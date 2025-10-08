local presets = require("markview.presets")
local markview = {
	preview = {
		filetypes = { "markdown", "Avante" },
		ignore_buftypes = {},
	},
	max_length = 79,

	markdown = {
		headings = {
			shift_width = 0,
			heading_1 = {
				style = "label",
				icon = "▋",
				sign_hl = "MarkviewCol7Fg",
				shift_hl = "-",
				hl = "@markup.heading.1.markdown",
			},
			heading_2 = {
				style = "label",
				icon = "## ",
				sign_hl = "col_2_fg",
				hl = "@markup.heading.2.markdown",
			},
			heading_3 = {
				style = "label",
				icon = "### ",
				sign_hl = "col_1_fg",
				hl = "@markup.heading.3.markdown",
			},
			heading_4 = {
				style = "label",
				icon = "#### ",
				sign_hl = "col_1_fg",
				hl = "@markup.heading.4.markdown",
			},
			heading_5 = {
				style = "label",
				sign = "󰼓",
				sign_hl = "col_1_fg",
				hl = "@markup.heading.5.markdown",
			},
			heading_6 = {
				style = "label",
				sign = "󰎴",
				sign_hl = "col_1_fg",
				hl = "@markup.heading.6.markdown",
			},
		},
		code_blocks = {
			enable = true,

			style = "simple",

			label_direction = "right",

			border_hl = "lualine_c_branch",
			info_hl = "lualine_c_branch",

			min_width = 60,
			pad_amount = 2,
			pad_char = " ",

			sign = true,

			default = {
				block_hl = "MarkviewCode",
				pad_hl = "MarkviewCode",
			},
		},
		list_items = {
			enable = true,
			wrap = true,
			indent_size = 2,
			shift_width = 4,
			marker_minus = {
				add_padding = false,

				text = "",
				hl = "MarkviewListItemMinus",
			},
			marker_plus = {
				add_padding = false,

				text = "",
				hl = "MarkviewListItemPlus",
			},
			marker_star = {
				add_padding = false,

				text = "",
				hl = "MarkviewListItemStar",
			},

			--- These items do NOT have a text or
			--- a hl property!

			--- n. Items
			marker_dot = {
				add_padding = false,
			},

			--- n) Items
			marker_parenthesis = {
				add_padding = false,
			},
		},
		callbacks = {
			on_enable = function(_, win)
				-- https://github.com/OXY2DEV/markview.nvim/issues/75
				vim.wo[win].wrap = false

				-- 解释： https://segmentfault.com/q/1010000000532491 -
				--
				vim.wo[win].conceallevel = 2
				vim.wo[win].concealcursor = "nivc"
			end,
		},

		horizontal_rules = {
			enable = true,

			parts = {
				{
					type = "repeating",
					direction = "left",

					repeat_amount = function(buffer)
						local utils = require("markview.utils")
						local window = utils.buf_getwin(buffer)

						local width = vim.api.nvim_win_get_width(window)
						local textoff = vim.fn.getwininfo(window)[1].textoff

						return math.floor((width - textoff - 3) / 2)
					end,

					text = "─",

					hl = {
						"MarkviewGradient1",
						"MarkviewGradient1",
						"MarkviewGradient2",
						"MarkviewGradient2",
						"MarkviewGradient3",
						"MarkviewGradient3",
						"MarkviewGradient4",
						"MarkviewGradient4",
						"MarkviewGradient5",
						"MarkviewGradient5",
						"MarkviewGradient6",
						"MarkviewGradient6",
						"MarkviewGradient7",
						"MarkviewGradient7",
						"MarkviewGradient8",
						"MarkviewGradient8",
						"MarkviewGradient9",
						"MarkviewGradient9",
					},
				},
				{
					type = "text",

					text = "  ",
					hl = "MarkviewIcon3Fg",
				},
				{
					type = "repeating",
					direction = "right",

					repeat_amount = function(buffer) --[[@as function]]
						local utils = require("markview.utils")
						local window = utils.buf_getwin(buffer)

						local width = vim.api.nvim_win_get_width(window)
						local textoff = vim.fn.getwininfo(window)[1].textoff

						return math.ceil((width - textoff - 3) / 2)
					end,

					text = "─",
					hl = {
						"MarkviewGradient1",
						"MarkviewGradient1",
						"MarkviewGradient2",
						"MarkviewGradient2",
						"MarkviewGradient3",
						"MarkviewGradient3",
						"MarkviewGradient4",
						"MarkviewGradient4",
						"MarkviewGradient5",
						"MarkviewGradient5",
						"MarkviewGradient6",
						"MarkviewGradient6",
						"MarkviewGradient7",
						"MarkviewGradient7",
						"MarkviewGradient8",
						"MarkviewGradient8",
						"MarkviewGradient9",
						"MarkviewGradient9",
					},
				},
			},
		},
		tables = {
			enable = true,
			use_virt_lines = true, -- so don't need to add spaces for table-outline to match inner text

			text = {
				{
					--    Main parts    Seperators
					"",
					"─",
					"",
					"┬",
					"├",
					"│",
					"┤",
					"┼",
					"",
					"─",
					"",
					"┴",
					"╼",
					"╾",
					"╴",
					"╶",
				},
			},
		},
		block_quotes = {
			wrap = true,
			enable = true,

			default = {
				border = "▋",
				border_hl = "fg_gray",
			},

			callouts = {
				--- From `Obsidian`
				{
					match_string = "ABSTRACT",
					callout_preview = "󱉫 Abstract",
					callout_preview_hl = "fg_cyan",

					custom_title = true,
					custom_icon = "󱉫 ",

					border = "▋",
					border_hl = "fg_cyan",
				},
				{
					match_string = "TODO",
					callout_preview = " Todo",
					callout_preview_hl = "fg_pink",

					custom_title = true,
					custom_icon = " ",

					border = "▋",
					border_hl = "fg_pink",
				},
				{
					match_string = "SUCCESS",
					callout_preview = "󰗠 Success",
					callout_preview_hl = "fg_green",

					custom_title = true,
					custom_icon = "󰗠 ",

					border = "▋",
					border_hl = "fg_green",
				},
				{
					match_string = "QUESTION",
					callout_preview = "󰋗 Question",
					callout_preview_hl = "fg_purple",

					custom_title = true,
					custom_icon = "󰋗 ",

					border = "▋",
					border_hl = "fg_purple",
				},
				{
					match_string = "FAILURE",
					callout_preview = "󰅙 Failure",
					callout_preview_hl = "fg_red",

					custom_title = true,
					custom_icon = "󰅙 ",

					border = "▋",
					border_hl = "fg_red",
				},
				{
					match_string = "DANGER",
					callout_preview = " Danger",
					callout_preview_hl = "fg_red",

					custom_title = true,
					custom_icon = "  ",

					border = "▋",
					border_hl = "fg_red",
				},
				{
					match_string = "BUG",
					callout_preview = " Bug",
					callout_preview_hl = "fg_yellow",

					custom_title = true,
					custom_icon = "  ",

					border = "▋",
					border_hl = "fg_yellow",
				},
				{
					match_string = "EXAMPLE",
					callout_preview = "󱖫 Example",
					callout_preview_hl = "fg_purple",

					custom_title = true,
					custom_icon = " 󱖫 ",

					border = "▋",
					border_hl = "fg_purple",
				},
				{
					match_string = "QUOTE",
					callout_preview = " Quote",
					callout_preview_hl = "fg_gray",

					custom_title = true,
					custom_icon = "  ",

					border = "▋",
					border_hl = "fg_gray",
				},
				{
					match_string = "NOTE",
					callout_preview = "󰋽 Note",
					callout_preview_hl = "fg_cyan",

					border = "▋",
					border_hl = "fg_cyan",
				},
				{
					match_string = "TIP",
					callout_preview = " Tip",
					callout_preview_hl = "fg_green",

					border = "▋",
					border_hl = "fg_green",
				},
				{
					match_string = "IMPORTANT",
					callout_preview = " Important",
					callout_preview_hl = "fg_pink",

					border = "▋",
					border_hl = "fg_pink",
				},
				{
					match_string = "WARNING",
					callout_preview = " Warning",
					callout_preview_hl = "fg_red",

					border = "▋",
					border_hl = "fg_red",
				},
				{
					match_string = "CAUTION",
					callout_preview = "󰳦 Caution",
					callout_preview_hl = "fg_yellow",

					border = "▋",
					border_hl = "fg_yellow",
				},
				{
					match_string = "CUSTOM",
					callout_preview = "󰠳 Custom",
					callout_preview_hl = "fg_cyan",

					custom_title = true,
					custom_icon = " 󰠳 ",

					border = "▋",
					border_hl = "fg_cyan",
				},
			},
		},
		checkboxes = {
			enable = true,
			checked = {
				text = " ",
				hl = "fg_green",
			},
			unchecked = {
				text = " ",
				hl = "fg_lavender",
			},
			pending = {
				text = " ",
				hl = "fg_yellow",
			},
			custom = {
				{
					match_string = "~",
					text = "󰪢 ",
					hl = "fg_red",
					scope_hl = nil,
				},
			},
		},
	},
}

return markview
