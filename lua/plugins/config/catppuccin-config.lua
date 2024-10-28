local catppuccin_config = {
	integrations = {
		barbar = true,
		treesitter = true,
		native_lsp = {
			enabled = true,
			virtual_text = {
				errors = { "italic" },
				hints = { "italic" },
				warnings = { "italic" },
				information = { "italic" },
				ok = { "italic" },
			},
			underlines = {
				errors = { "underline" },
				hints = { "underline" },
				warnings = { "underline" },
				information = { "underline" },
				ok = { "underline" },
			},
			inlay_hints = {
				background = true,
			},
		},
		cmp = true,
		gitsigns = true,
		telescope = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = true,
		},
		notify = true,
		fidget = true,
		noice = true,
		treesitter_context = false,
		alpha = true,
		barbecue = {
			dim_dirname = true, -- directory name is dimmed by default
			bold_basename = true,
			dim_context = false,
			alt_background = false,
		},
		render_markdown = false,
		lsp_trouble = true,
	},
	custom_highlights = function(C)
		local catppuccin_hightlight = C.lavender
		local background_hightlight = C.base

		require("lspconfig.ui.windows").default_options.border = "single"
		return {
			-- Normal
			NormalFloat = { bg = C.bg, fg = catppuccin_hightlight },
			FloatBorder = { fg = catppuccin_hightlight },
			TextError = { fg = C.red },
			TextWarning = { fg = C.yellow },
			TextInfo = { fg = C.blue },
			TextHint = { fg = C.green },
			InlayHint = { fg = C.blue, bg = background_hightlight },
			LspInlayHint = { fg = C.blue, bg = background_hightlight },

			-- Singcolumn numbers
			LineNr = { fg = "#717790" },

			-- Trouble
			TroubleNormal = { bg = background_hightlight },

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

			-- Markdown preview
			markdownH1 = { fg = C.teal },
			markdownH2 = { fg = C.blue },
			markdownH3 = { fg = C.peach },
			markdownH4 = { fg = C.yellow },
			markdownH5 = { fg = C.pink },
			markdownH6 = { fg = C.mauve },
			RenderMarkdownProccess = { fg = C.pink },

			-- Markview
			fg_cyan = { fg = C.sky },
			fg_pink = { fg = C.pink },
			fg_green = { fg = C.green },
			fg_red = { fg = C.red },
			fg_purple = { fg = C.mauve },
			fg_yellow = { fg = C.yellow },
			fg_gray = { fg = C.overlay2 },
		}
	end,
}
return catppuccin_config
