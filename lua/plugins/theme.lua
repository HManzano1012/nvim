local theme = {
	{
		"catppuccin/nvim",
		config = function()
			require("catppuccin").setup({
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					cmp = true,
					gitsigns = false,
					telescope = true,
					indent_blankline = {
						enabled = true,
						colored_indent_levels = false,
					},
					notify = true,
					overseer = false,
					fidget = true,
					treesitter_context = false,
				},
				custom_highlights = function(C)
					return {
						TelescopeBorder = { fg = C.white },
						NormalFloat = { bg = C.bg, fg = C.white },
						FloatBorder = { fg = "#cdd6f5" },
						MasonNormal = { fg = C.white },
						LazyNormal = { fg = C.white },
						FloatTitle = { fg = C.white },
						TextError = { fg = C.red },
						TextWarning = { fg = C.yellow },
						TextInfo = { fg = C.blue },
						TextHint = { fg = C.green },
						CmpSel = { fg = C.base, bg = C.blue },
						CmpItemKindSnippet = { fg = C.mauve },
						CmpItemKindKeyword = { fg = C.red },
						CmpItemKindText = { fg = C.teal },
						CmpItemKindMethod = { fg = C.blue },
						CmpItemKindConstructor = { fg = C.blue },
						CmpItemKindFunction = { fg = C.blue },
						CmpItemKindFolder = { fg = C.blue },
						CmpItemKindModule = { fg = C.blue },
						CmpItemKindConstant = { fg = C.peach },
						CmpItemKindField = { fg = C.green },
						CmpItemKindProperty = { fg = C.green },
						CmpItemKindEnum = { fg = C.green },
						CmpItemKindUnit = { fg = C.green },
						CmpItemKindClass = { fg = C.yellow },
						CmpItemKindVariable = { fg = C.flamingo },
						CmpItemKindFile = { fg = C.blue },
						CmpItemKindInterface = { fg = C.yellow },
						CmpItemKindColor = { fg = C.red },
						CmpItemKindReference = { fg = C.red },
						CmpItemKindEnumMember = { fg = C.red },
						CmpItemKindStruct = { fg = C.blue },
						CmpItemKindValue = { fg = C.peach },
						CmpItemKindEvent = { fg = C.blue },
						CmpItemKindOperator = { fg = C.blue },
						CmpItemKindTypeParameter = { fg = C.blue },
						CmpItemKindCopilot = { fg = C.teal },
					}
				end,
			})
			require("mason").setup({
				ui = {
					border = "single",
				},
			})
			require("lspconfig.ui.windows").default_options.border = "single"
		end,
	},
	{
		"maxmx03/dracula.nvim",
	},
	{
		"navarasu/onedark.nvim",
	},
	{
		"cpea2506/one_monokai.nvim",
	},
	{
		"projekt0n/github-nvim-theme",
	},
	{
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				transparent = true,
			})
		end,
	},
}

return theme
