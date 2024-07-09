local catppuccin_config = {
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
		local white_hightlight = "#cdd6f5"
		local background_hightlight = "#1e1e2e"

		require("lspconfig.ui.windows").default_options.border = "single"
		return {
			-- Normal
			NormalFloat = { bg = C.bg, fg = white_hightlight },
			FloatBorder = { fg = white_hightlight },
			TextError = { fg = C.red },
			TextWarning = { fg = C.yellow },
			TextInfo = { fg = C.blue },
			TextHint = { fg = C.green },

			-- Telescope
			TelescopeBorder = { fg = white_hightlight },
			TelescopePromptTitle = { fg = background_hightlight, bg = C.lavender },
			TelescopeResultsTitle = { fg = background_hightlight, bg = C.red },
			TelescopePreviewTitle = { fg = background_hightlight, bg = C.green },

			-- Mason
			MasonNormal = { fg = white_hightlight },

			-- Noice
			NoicePopupBorder = { fg = white_hightlight },
			NoiceCmdlinePopupBorder = { fg = white_hightlight },
			NoiceSearchPopupBorder = { fg = white_hightlight },
			NoiceCmdlinePopupBorderSearch = { fg = white_hightlight },
			NoiceCmdlinePopupTitle = { fg = white_hightlight },

			-- Cmp
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
}
return catppuccin_config
