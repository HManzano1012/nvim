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
			colored_indent_levels = true,
		},
		notify = true,
		fidget = true,
		treesitter_context = false,
	},
	custom_highlights = function(C)
		local catppuccin_hightlight = C.lavender
		local background_hightlight = "#1e1e2e"

		require("lspconfig.ui.windows").default_options.border = "single"
		return {
			-- Normal
			NormalFloat = { bg = C.bg, fg = catppuccin_hightlight },
			FloatBorder = { fg = catppuccin_hightlight },
			TextError = { fg = C.red },
			TextWarning = { fg = C.yellow },
			TextInfo = { fg = C.blue },
			TextHint = { fg = C.green },

			-- Telescope
			TelescopeBorder = { fg = catppuccin_hightlight },
			TelescopePromptTitle = { fg = background_hightlight, bg = catppuccin_hightlight },
			TelescopeResultsTitle = { fg = background_hightlight, bg = C.red },
			TelescopePreviewTitle = { fg = background_hightlight, bg = C.green },
			-- Mason
			MasonNormal = { fg = catppuccin_hightlight },

			-- Noice
			NoicePopupBorder = { fg = catppuccin_hightlight },
			NoiceCmdlinePopupBorder = { fg = catppuccin_hightlight },
			NoiceSearchPopupBorder = { fg = catppuccin_hightlight },
			NoiceCmdlinePopupBorderSearch = { fg = catppuccin_hightlight },
			NoiceCmdlinePopupTitle = { fg = catppuccin_hightlight },
			NoicePopupMenu = { bg = C.bg, fg = catppuccin_hightlight },

			-- Cmp
			CmpSel = { fg = C.base, bg = catppuccin_hightlight },
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
