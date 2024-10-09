local render_markdown = {
	win_options = {
		-- See :h 'conceallevel'
		conceallevel = {
			-- Used when not being rendered, get user setting
			default = vim.api.nvim_get_option_value("conceallevel", {}),
			-- Used when being rendered, concealed text is completely hidden
			rendered = 1,
		},
		-- See :h 'concealcursor'
		concealcursor = {
			-- Used when not being rendered, get user setting
			default = vim.api.nvim_get_option_value("concealcursor", {}),
			-- Used when being rendered, disable concealing text in all modes
			rendered = "",
		},
	},
	indent = {
		-- Turn on / off org-indent-mode
		enabled = true,
		-- Amount of additional padding added for each heading level
		per_level = 4,
		-- Heading levels <= this value will not be indented
		-- Use 0 to begin indenting from the very first level
		skip_level = 1,
		-- Do not indent heading titles, only the body
		skip_heading = true,
	},
	heading = {
		width = "block",
		-- position = "inline",
		min_width = 78,
		icons = { "  ", "  ", "  ", "  ", "󱑻  ", "  " },
		backgrounds = {
			"white",
			"white",
			"white",
			"white",
			"white",
			"white",
		},
		foregrounds = {
			"markdownH1",
			"markdownH2",
			"markdownH3",
			"markdownH4",
			"markdownH5",
			"markdownH6",
		},
	},
	code = {
		width = "block",
		border = "thin",
		-- Used above code blocks for thin border
		above = "",
		-- Used below code blocks for thin border
		below = "",
	},
	dash = {
		-- Turn on / off thematic break rendering
		enabled = true,
		-- Replaces '---'|'***'|'___'|'* * *' of 'thematic_break'
		-- The icon gets repeated across the window's width
		icon = "─",
		-- Width of the generated line:
		--  <integer>: a hard coded width value
		--  full:      full width of the window
		width = 78,
		-- Highlight for the whole line generated from the icon
		highlight = "RenderMarkdownDash",
	},
	checkbox = {
		custom = {
			attention = { raw = "[!]", rendered = "󰳤 ", highlight = "RenderMarkdownTodo" },
			canceled = { raw = "[~]", rendered = " ", highlight = "RenderMarkdownError" },
			process = { raw = "[>]", rendered = "󰧛 ", highlight = "RenderMarkdownProccess" },
		},
	},
	bullet = {
		-- Turn on / off list bullet rendering
		enabled = true,
		-- Replaces '-'|'+'|'*' of 'list_item'
		-- How deeply nested the list is determines the 'level'
		-- The 'level' is used to index into the array using a cycle
		-- If the item is a 'checkbox' a conceal is used to hide the bullet instead
		icons = { "●", "○", "◆", "◇" },
	},
}

return render_markdown
